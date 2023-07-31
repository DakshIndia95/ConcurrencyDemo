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

typealias Handler<T> = (Result<T,ApiError>) -> (Void)

struct ApiHandler {
    
    //MARK: fetch data using async await
    func fetchDataUsingAsync<T:Decodable>(url:String) async throws -> T{
        guard let url = URL(string: url) else {
            throw ApiError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    //MARK: fetch data using closure
    func fetchDataWithoutAsync<T:Decodable>(url:String,type:T.Type,completion: @escaping Handler<T>){
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let apiResponse = try JSONDecoder().decode(type, from: data)
                print("Api response: \(apiResponse)")
                DispatchQueue.main.async {
                    completion(.success(apiResponse))
                }
            }catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
