//
//  ResultViewModel.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import Foundation

class ResultViewModel: ObservableObject {
    
    @Published var allWords: [Word] = []
    
    private let dataService = WordDataService() 
}
