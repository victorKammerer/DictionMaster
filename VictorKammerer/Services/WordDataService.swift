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
            
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Server Error", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let word = try decoder.decode([Word].self, from: data)
                guard let wordDetails = word.first else {
                    completion(.failure(NSError(domain: "No word info found", code: 0, userInfo: nil)))
                    return
                }
                completion(.success(wordDetails))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
