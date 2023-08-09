//
//  ApiService.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

let baseUrl = "http://45.155.207.232:8080/api/v2/"

class NetworkDataSource {
    
    func request <T: Decodable>(
        url: String = baseUrl,
        path: String = ""
    ) async throws -> T? {
        typealias modelType = T

        let url = URL(string: baseUrl + path)
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url!))

        return try? JSONDecoder().decode(modelType.self, from: data)
    }
}
