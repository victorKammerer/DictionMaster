//
//  ResultViewModel.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import Foundation

class ResultViewModel: ObservableObject {
    
    @Published var searchWord: String = ""
    @Published var searchedWord: [Word] = []
    
    private let dataService = WordDataService()
    
    init() {
        addWord()
    }
    
    func addWord() {
        dataService.$searchedWord
            .sink { [weak self] (returnedWord) in
                self?.searchedWord = returnedWord
            }
    }

}
