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
    
    // State to store an array of Location objects
    @State var locations: [Location] = []

    var body: some View {
        // Display a MapView, passing in the locations state as a binding
        MapView(locations: $locations)
            .accentColor(Color(.green))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                loadData()
            }
    }

    private func loadData() {
        // Get the URL of the locations.json file
        if let fileLocation = Bundle.main.url(forResource: "locations", withExtension: "json") {
            do {
                // Read the contents of the file into a Data object
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // Decode the data into an array of Location objects
                let locations = try decoder.decode([Location].self, from: data)
                // Update the state with the decoded locations
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
    
    // A binding to the state containing the array of Location objects
    @Binding var locations: [Location]
    // Create a LocationManager object to get the user's current location
    @StateObject var manager = LocationManager()

    // Creates a new MKMapView object when this view is first displayed
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        return mapView
    }

    // Updates the view with new data
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove any existing annotations from the map
        uiView.removeAnnotations(uiView.annotations)

        // Add a new annotation for each location in the array
        for location in locations {
            let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = location.title
                uiView.addAnnotation(annotation)
        }
        
        // If we have a valid user location, center the map on that location
        if let userLocation = manager.location?.coordinate {
                let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
                uiView.userTrackingMode = .none
                uiView.setRegion(region, animated: true)
            }
    }
}
