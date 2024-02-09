//
//  WordDataService.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import Foundation

class WordDataService {
    
    @Published var searchedWord: Word
    
    init() {
        getWord()
    }
    
    private func getWord() {
        
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(searchedWord)") else { return }
        print(MainView().searchWord)
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                    
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: Word.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { (returnedWord) in
                self.searchedWord = returnedWord
            }
        
    }
    
    
}
