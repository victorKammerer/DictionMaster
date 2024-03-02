//
//  SearchViewModl.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchedWord: String = ""
    @Published var buttonAppearing: Bool = false
    @Published var subscribeAppearing: Bool = false
    @Published var resultAppearing = false
    @Published var word: Word?
    
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
        } else {
            if Calendar.current.isDateInToday(Date(timeIntervalSinceReferenceDate: lastSearchDate)) && searchCount >= 5 {
                if resultAppearing {
                    resultAppearing = false
                }
                subscribeAppearing = true
                return
            } else {
                fetchWord()
            }
        }
    }

    private func fetchWord() {
        searchCount += 1

        let apiService = WordDataService()
        
        apiService.fetchWord(for: searchedWord) { result in
            switch result {
            case .success(let word):
                self.word = word
                self.resultAppearing = true
                self.searchedWordCache[self.searchedWord] = word
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func buttonAppears() {
        buttonAppearing = !searchedWord.isEmpty
    }
}
