//
//  ApiService.swift
//  Turtle
//
//  Created by Марат Наврузаиев on 16.07.2023.
//

import Foundation

let baseUrl = "http://45.155.207.232:8080/api/v2/"

class BaseNetworkDataSource<T: Decodable>: Response {
    typealias modelType = T
    
    func request(
        url: String = baseUrl,
        path: String = "",
        task: @escaping (T?) -> Void
    ){
        let url = URL(string: baseUrl + path)
        let task = URLSession.shared.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            DispatchQueue.main.async {
                if let data = data {
                    task(try? JSONDecoder().decode(modelType.self, from: data))
                } else {
                    task(nil)
                }
            }
            
        }
        task.resume()
    }
}

protocol Response {
    associatedtype modelType: Decodable
}
