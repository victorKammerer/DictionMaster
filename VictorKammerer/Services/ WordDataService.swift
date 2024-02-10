//
//  WordDataService.swift
//  VictorKammerer
//
//  Created by Victor Kammerer on 04/02/24.
//

import Foundation

class WordDataService {
    
    func fetchWord(for word: String, completion: @escaping (Result<Word, Error>) -> Void) {
        
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)") else {
            
            completion(.failure(NSError(domain: "ERROR: Invalid URL", code: 0, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                completion(.failure(NSError(domain: "ERROR: Bad server response", code: 0, userInfo: nil)))
                return
            }
            
            // Ensure data is present
            guard let data = data else {
                completion(.failure(NSError(domain: "Error decoding JSON: The data couldn’t be read because it isn’t in the correct format.", code: 0, userInfo: nil)))
                return
            }
            
            // Parse JSON response
            do {
                let decoder = JSONDecoder()
                let wordDetails = try decoder.decode([Word].self, from: data)
                
                // Ensure at least one word detail is available
                guard let firstWord = wordDetails.first else {
                    completion(.failure(NSError(domain: "Error decoding JSON: The data couldn’t be read because it is missing.", code: 0, userInfo: nil)))
                    return
                }
                
                // Invoke completion with successful result
                completion(.success(firstWord))
            } catch {
                // Invoke completion with error
                completion(.failure(error))
            }
        }.resume()
    }

}
