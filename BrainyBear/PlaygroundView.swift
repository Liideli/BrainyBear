//
//  PlaygroundView.swift
//  BrainyBear
//
//  Created by iosdev on 31.3.2023.
//

import SwiftUI
import MapKit
import Foundation

struct PlaygroundView: View {
    @State var locations: [Location] = []

    var body: some View {
        MapView(locations: $locations)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                loadData()
            }
    }

    private func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "locations", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let locations = try decoder.decode([Location].self, from: data)
                self.locations = locations
            } catch {
                print("error", error)
            }
        }
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}

struct MapView: UIViewRepresentable {
    @Binding var locations: [Location]
    @StateObject var manager = LocationManager()

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)

        for location in locations {
            let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = location.title
                uiView.addAnnotation(annotation)
        }
        
        var region: Binding<MKCoordinateRegion>? {
            guard let location = manager.location else {
                return MKCoordinateRegion.goldenGateRegion().getBinding()
            }
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 50, longitudinalMeters: 50)
            
            return region.getBinding()
        
        }
    }
}

