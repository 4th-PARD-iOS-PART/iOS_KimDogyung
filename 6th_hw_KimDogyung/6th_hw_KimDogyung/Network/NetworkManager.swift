//
//  NetworkManager.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/29.
//

import UIKit

class NetworkManager {
    
    // NetworkManager는 네트워크 요청에 관한 메소드를 제공하는 클래스
    // 싱글톤 패턴으로 생성하여 하나의 객체만 생성되도록해서 전역적으로 사용
    // 생성자를 숨겨서 여러 객체를 생성하지 못하도록 함
    
    static let shared = NetworkManager() // Singleton instance
    private init() {} // Private initializer to enforce singleton pattern
    
    
    // <T: Decodable> 제네릭 타입 설정 -> 어떤 Decodable type도 이 함수로 처리 가능. 따로 함수들을 만들 필요가 없음
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
