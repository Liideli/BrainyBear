//
//  PlaygroundView.swift
//  BrainyBear
//
//  Created by iosdev on 31.3.2023.
//

import SwiftUI
import MapKit

struct PlaygroundView: View {
    
    @ObservedObject var datas = Json()
    
    @State var model: [Model] = []
    
    @StateObject var manager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = manager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        return region.getBinding()
    }
    
    var body: some View {
        VStack {
            if let region = region {
                Map(
                    coordinateRegion: region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow),
                    annotationItems: model
                ) { model in
                    MapAnnotation(
                        coordinate: CLLocationCoordinate2D(
                            latitude: model.location.coordinates[0],
                            longitude: model.location.coordinates[1]
                        )
                    ){
                        VStack {
                            Text(model.name.en ?? model.name.fi)
                        }
                    }   
                }
            }
        }
    }
}

class Json: ObservableObject {
    @Published var json = [Model]()
    
    init() {
        load()
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "locations", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([Model].self, from: data)
                    print(json)
                    
                    DispatchQueue.main.sync {
                        self.json = json
                    }
                    
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

struct PlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundView()
    }
}

