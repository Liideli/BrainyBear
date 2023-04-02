//
//  PlaygroundView.swift
//  BrainyBear
//
//  Created by iosdev on 31.3.2023.
//

import SwiftUI
import MapKit

struct PlaygroundView: View {
    
    @StateObject var manager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = manager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        return region.getBinding()
    }
    
    var body: some View {
        if let region = region {
            Map(coordinateRegion: region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow))
            .ignoresSafeArea()
            .frame(width: 400, height: 700)
        }
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}
