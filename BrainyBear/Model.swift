//
//  Model.swift
//  BrainyBear
//
//  Created by iosdev on 3.4.2023.
//

import Foundation
import MapKit

struct Location: Identifiable, Decodable {
    let id: Int
    let name: [String: String]
    let location: LocationData?

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location?.coordinates[1] ?? 1000, longitude: location?.coordinates[0] ?? 1000)
    }

    var title: String {
        name["fi"] ?? ""
    }
}

struct LocationData: Decodable {
    let type: String
    let coordinates: [Double]
}
