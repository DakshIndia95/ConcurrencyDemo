//
//  UserModel.swift
//  ConcurrencyDemo
//
//  Created by Neosoft on 31/07/23.
//

import Foundation

struct TeamsModel: Decodable {
    let id : Int
    let name, username, email : String
    let age : MyAgeType
    let birthDate : Date
    let teamLogo: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case username
        case email
        case age
        case birthDate
        case teamLogo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decodeIfPresent(String.self, forKey: .username) ?? "N/A"
        self.email = try container.decode(String.self, forKey: .email)
        self.age = try container.decode(MyAgeType.self, forKey: .age)
        self.birthDate = try container.decode(Date.self, forKey: .birthDate)
        self.teamLogo = try container.decode(String.self, forKey: .teamLogo)
    }
}

enum MyAgeType: Codable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self){
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self){
            self = .string(stringValue)
            return
        }
        
        throw MydataError.missingValue
    }
    
    enum MydataError : Error {
        case missingValue
    }
}

