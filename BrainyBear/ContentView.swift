//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI
import SceneKit
import CoreData

struct ContentView: View {
    // Localized string keys
    let map:LocalizedStringKey = "map"
    let draw:LocalizedStringKey = "draw"
    let story:LocalizedStringKey = "story"
    let math:LocalizedStringKey = "math"
    
    @Environment(\.managedObjectContext) private var managedObjectContext
        
    @State private var coins: Int?
    
    var body: some View {
        NavigationView {
            Color.bbLightBrown
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        Group {
                            HStack {
                                NavigationLink {
                                    InfoView()
                                } label: {
                                    Image(systemName: "info.circle")
                                        .padding()
                                        .font(.system(size: 25))
                                        .background(Color.bbLilac, in: Capsule())
                                        .foregroundColor(.bbBlack)
                                        .padding()
                                }
                                Spacer()
                                HStack {
                                    Text("💰 \(coins ?? 0)")
                                        .onAppear(perform: {
                                            coins = DataController.shared.fetchScore()
                                        })
                                        .foregroundColor(Color.bbBlack)
                                        .padding()
                                        .background(Color.bbLilac, in: Capsule())
                                        .shadow(radius: 5)
                                        .font(.custom("Verdana", fixedSize: 25))
                                    
                                }
                                Spacer()
                                NavigationLink{
                                    ShopView()
                                }
                            label:  {
                                Image(systemName: "gearshape.fill")
                                    .padding()
                                    .font(.system(size: 25))
                                    .background(Color.bbLilac, in: Capsule())
                                    .foregroundColor(.bbBlack)
                                    .padding()
                            }
                            }
                        }
                        .padding(.bottom, -20)
                        VStack{
                            Group {
                                SceneView(scene: SCNScene(named: "Brian.usdc"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                                    .padding()
                                    .shadow(radius: 15)
                                HStack (spacing: 30){
                                    NavigationLink {
                                        AugmentedRealityView()
                                    } label: {
                                        Image(systemName: "camera.viewfinder")
                                    }
                                    .padding(10)
                                    .foregroundColor(Color.bbBlack)
                                    .font(.system(size: 35))
                                    .background(Color.bbLilac, in: Capsule())
                                    .offset(y: -90)
                                    .padding(.bottom, -90)
                                    NavigationLink {
                                        AugmentedRealityView()
                                    } label: {
                                        Image(systemName: "mic.circle")
                                    }
                                    .padding(10)
                                    .foregroundColor(Color.bbBlack)
                                    .font(.system(size: 35))
                                    .background(Color.bbLilac, in: Capsule())
                                    .offset(y: -90)
                                    .padding(.bottom, -90)
                                    NavigationLink {
                                        ShopView()
                                    } label: {
                                        Image(systemName: "cart.circle")
                                    }
                                    .padding(10)
                                    .foregroundColor(Color.bbBlack)
                                    .font(.system(size: 35))
                                    .background(Color.bbLilac, in: Capsule())
                                    .offset(y: -90)
                                    .padding(.bottom, -90)
                                }
                            }
                            
                            Group {
                                HStack {
                                    NavigationLink{
                                        PlaygroundView()
                                    } label: {
                                        VStack {
                                            Image(systemName: "map")
                                                .font(.system(size: 60))
                                            Text(map)
                                                .font(.system(size: 25))
                                        }
                                    }
                                    .frame(width: 150, height: 150 )
                                    .background(Color.bbBabyBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    
                                    NavigationLink{
                                        CanvasView()
                                    } label: {
                                        VStack {
                                            Image(systemName: "paintbrush")
                                                .font(.system(size: 60))
                                            Text(draw)
                                                .font(.system(size: 25))
                                        }
                                    }
                                    .frame(width: 150, height: 150 )
                                    .background(Color.bbBabyBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                            
                            Group {
                                HStack {
                                    NavigationLink{
                                        StoryUI()
                                    } label: {
                                        VStack {
                                            Image(systemName: "books.vertical")
                                                .font(.system(size: 60))
                                            Text(story)
                                                .font(.system(size: 25))
                                        }
                                    }
                                    .frame(width: 150, height: 150 )
                                    .background(Color.bbBabyBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    
                                    NavigationLink {
                                        MathGameView()
                                    }
                                label: {
                                    VStack {
                                        Image(systemName: "plus.forwardslash.minus")
                                            .font(.system(size: 60))
                                        Text(math)
                                            .font(.system(size: 25))
                                    }
                                }
                                .frame(width: 150, height: 150 )
                                .background(Color.bbBabyBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                }
                            }
                        }
                        
                    })
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
