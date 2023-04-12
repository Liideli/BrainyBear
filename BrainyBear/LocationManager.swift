//
//  Map.swift
//  BrainyBear
//
//  Created by iosdev on 31.3.2023.
//

import UIKit
import MapKit
import CoreLocation
import SwiftUI

final class LocationManager: NSObject, ObservableObject {
    
    @Published var location: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLHeadingFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.location = location
        }
    }
}

extension MKCoordinateRegion {
    static func goldenGateRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.1097541, longitude: 24.6890542),
                           latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}

/**
extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<[Model], Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let model = try JSONDecoder().decode([Model].self, from: data)
                    completion(.success(model))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
} */
