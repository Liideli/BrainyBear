//
//  Model.swift
//  BrainyBear
//
//  Created by iosdev on 3.4.2023.
//

import Foundation

struct Model: Codable, Identifiable {
    
    let id: Int
    let name: Name
    let street_address: Address
    //let location: Location
    
    enum CodingKeys: String, CodingKey {
        case id, name, street_address
        //case location
    }
}

struct Name: Codable {
    let fi: String
    let sv: String?
    let en: String?
    enum CodingKeys: String, CodingKey {
        case fi, sv, en
    }
}

struct Address: Codable {
    let fi: String
    let sv: String?
    let en: String?
    enum CodingKeys: String, CodingKey {
        case fi, sv, en
    }
}
/**
struct Location: Codable {
    let coordinates: [Double : Double]
    enum CodingKeys: String, CodingKey {
        case coordinates
    }
}
*/
