//
//  SearchViewModl.swift
//  VictorKammerer
//
//  Created by Wilma Ferreira on 04/02/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var searchWord: String = ""
    @Published var searchResults: Word
    
    func search() {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(searchWord)") else {
            print("Invalid URL")
            return
        }
        
        // Create a URLSession
        let session = URLSession(configuration: .default)
        
        // Create a data task
        let task = session.dataTask(with: url) { data, response, error in
            // Handle response
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                // Decode JSON response into an array of Word objects
                let decodedResponse = try JSONDecoder().decode(Word.self, from: data)
                
                // Update searchResults with the decoded response
                DispatchQueue.main.async {
                    self.searchResults = decodedResponse
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        // Start the data task
        task.resume()
    }
}
