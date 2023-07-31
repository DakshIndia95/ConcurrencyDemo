//
//  JsonHelper.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation

struct JSONHelper {
    func loadJsonDataFromFile() -> ([TeamsModel]?) {
        guard let url = Bundle.main.url(forResource: "TeamsaaData", withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        if let mainData = decodeData(data: data) {
            return mainData
        }
        return nil
    }
    
    private func decodeData( data: Data) -> [TeamsModel]? {
        let formatter = DateFormatter()
        let decoder = JSONDecoder()
        formatter.dateFormat = "HH:mm EEE, dd MMM y"
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let jsonData = try? decoder.decode([TeamsModel].self, from: data) else { return nil }
        return jsonData
    }
}
