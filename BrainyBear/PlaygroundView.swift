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
    
    @StateObject var manager = LocationManager()
    
    var region: Binding<MKCoordinateRegion>? {
        guard let location = manager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        return region.getBinding()
    }
    
    var body: some View {
        
        NavigationView {
            List(datas.json) { item in
                
                HStack {
                    Text("\(item.name.fi)")
                    Spacer()
                    Text("\(item.street_address.fi)")
                    Spacer()
                    //Text("\(item.location.coordinates)")

                }
            }
        }
        
        /**
        VStack {
            if let region = region {
                Map(coordinateRegion: region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow))
                .ignoresSafeArea()
                .frame(width: 400, height: 740)
                Button("Homebutton here"){}
            }
        }*/
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

