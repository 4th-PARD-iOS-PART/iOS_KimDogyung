//
//  NetworkManager.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/29.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager() // Singleton instance
    private init() {} // Private initializer to enforce singleton pattern
    
    
    
    func getRequest<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void){
        var request = URLRequest(url: url);
        request.httpMethod = "GET";
        
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            // error 처리
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            } catch {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }.resume()
        
    }
    
    func postRequest<T: Codable>(url: URL, body: T, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, !data.isEmpty else {
                DispatchQueue.main.async {
                    completion(.success(body)) // Pass back the original body since there’s no response to decode
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}

enum NetworkError: Error {
    case noData
    case decodingError(Error)
    case encodingError(Error)
    
}
