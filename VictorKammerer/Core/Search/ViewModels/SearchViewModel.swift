//
//  SearchViewModl.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import Foundation
import Combine
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchedWord: String = ""
    @Published var buttonAppearing: Bool = false
    @Published var subscribeAppearing: Bool = false
    @Published var resultAppearing: Bool = false
    @Published var fullScreenAppearing: Bool = false
    @Published var word: Word?
    @Published var isLoading: Bool = false
    @Published var isWrongEntry: Bool = false
    
    private var searchedWordCache: [String: Word] {
        get {
            if let data = UserDefaults.standard.data(forKey: "wordCache"),
               let cache = try? JSONDecoder().decode([String: Word].self, from: data) {
                return cache
            } else {
                return [:]
            }
        }
        
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "wordCache")
            }
        }
    }
    
    var searchCount: Int {
        get { UserDefaults.standard.integer(forKey: "searchCount") }
        set { UserDefaults.standard.set(newValue, forKey: "searchCount") }
    }
    
    var lastSearchDate: TimeInterval {
        get { UserDefaults.standard.double(forKey: "lastSearchDate") }
        set { UserDefaults.standard.set(newValue, forKey: "lastSearchDate") }
    }
    
    func searchWord() {
        let currentDate = Date()

        if !Calendar.current.isDateInToday(Date(timeIntervalSinceReferenceDate: lastSearchDate)) {
            searchCount = 0
            lastSearchDate = currentDate.timeIntervalSinceReferenceDate
        }

        if let WordCache = searchedWordCache[searchedWord] {
            word = WordCache
            resultAppearing = true
            fullScreenAppearing = true
        } else {
            fetchWord()
        }
    }

    private func fetchWord() {
        
        let apiService = WordDataService()
        
        apiService.fetchWord(for: searchedWord) { result in
            
            switch result {
            case .success(let word):
                if Calendar.current.isDateInToday(Date(timeIntervalSinceReferenceDate: self.lastSearchDate)) && self.searchCount >= 5 {
                    self.resultAppearing = false
                    self.subscribeAppearing = true
                    self.fullScreenAppearing = true
                } else {
                    self.searchCount += 1
                    self.word = word
                    self.searchedWordCache[self.searchedWord] = word
                    self.fullScreenAppearing = true
                    self.resultAppearing = true
                }
            case .failure(let error):
                print("Error: \(error)")
                self.isWrongEntry = true
            }
        }
    }
    
    func buttonAppears() {
        buttonAppearing = !searchedWord.isEmpty
    }
}
