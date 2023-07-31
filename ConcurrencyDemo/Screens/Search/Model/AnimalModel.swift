//
//  UserModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

// MARK: - AnimalModel
struct AnimalModel: Codable {
    let errorMessage: String
    let data: [AnimalData]
}

// MARK: - Datum
struct AnimalData: Codable {
    let name: String
    let image: String
}
