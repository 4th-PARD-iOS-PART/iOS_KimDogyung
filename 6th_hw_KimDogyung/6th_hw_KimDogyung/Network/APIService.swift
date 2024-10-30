//
//  APIService.swift
//  6th_hw_KimDogyung
//
//  Created by 김도경 on 2024/10/29.
//

import Foundation

struct APIService {
    // Base URL for API
    private let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"

    // Enum for specifying API endpoints
    enum Endpoint: String {
        case user = "/user"
    }

    // Method to construct full URL with query parameters
    func makeURL(endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        var urlString = baseURL + endpoint.rawValue

        // Adding query parameters
        if !queryParams.isEmpty {
            let queryString = queryParams.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
            urlString += "?\(queryString)"
        }

        return URL(string: urlString)
    }
}
