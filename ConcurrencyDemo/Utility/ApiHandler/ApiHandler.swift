//
//  ApiHandler.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
}
struct ApiHandler {
    
    func fetchUserUsingAsync<T:Decodable>(url:String) async throws -> T{
        guard let url = URL(string: url) else {
            throw ApiError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
