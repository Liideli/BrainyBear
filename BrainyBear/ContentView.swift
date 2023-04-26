//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI
import SceneKit
import UserNotifications
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
        
    @State private var coins: Int?
    
    var body: some View {
        NavigationView {
            Color("BBGray")
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
                                        .font(.system(size: 35))
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
                                        .shadow(radius: 5)
                                        .font(.custom("Verdana", fixedSize: 35))
                                    
                                }
                                Spacer()
                                NavigationLink{
                                    SettingsView()
                                }
                            label:  {
                                Image(systemName: "gearshape.fill")
                                    .padding()
                                    .font(.system(size: 35))
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
                                    .background(Color.bbBabyBlue, in: Capsule())
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
                                    .background(Color.bbBabyBlue, in: Capsule())
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
                                    .background(Color.bbBabyBlue, in: Capsule())
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
                                            Image("map-image")
                                                .resizable()
                                                .scaledToFit()
                                                .overlay(ImageOverlayMap(), alignment: .top)
                                        }
                                    }
                                        .frame(width: 190, height: 190 )
                                        .cornerRadius(10)
                                        
                                        NavigationLink{
                                            CanvasView()
                                        } label: {
                                            VStack {
                                                Image("draw-image")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .overlay(ImageOverlayDraw(), alignment: .top)
                                            }
                                        }
                                            .frame(width: 190, height: 190 )
                                            .cornerRadius(10)
                                        }
                                    }
                                    
                                    Group {
                                        HStack {
                                            NavigationLink{
                                                StoryUI()
                                            } label: {
                                                VStack {
                                                    Image("story-image")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .overlay(ImageOverlayStory(), alignment: .top)
                                                }
                                            }
                                            .frame(width: 190, height: 190 )
                                            .cornerRadius(10)
                                            
                                            NavigationLink {
                                                MathGameView()
                                            }
                                        label: {
                                            VStack {
                                                Image("math-image")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .overlay(ImageOverlayMath(), alignment: .top)
                                            }
                                        }
                                        .frame(width: 190, height: 190 )
                                        .cornerRadius(10)
                                        }
                                    }
                                }
                                
                            })
        }
    }
    
    struct ImageOverlayMap: View {
        
        let map:LocalizedStringKey = "map"
        
        var body: some View {
            ZStack {
                Text(map)
                    .padding(.top, 5)
                    .frame(width: 190)
                    .foregroundColor(.bbBlack)
                    .background(Color.bbLightBrown)
                    .font(.system(size: 25, weight: .bold))
            }
        }
    }
    
    struct ImageOverlayDraw: View {
        
        let draw:LocalizedStringKey = "draw"
        
        var body: some View {
            ZStack {
                Text(draw)
                    .padding(.top, 5)
                    .frame(width: 190)
                    .foregroundColor(.bbBlack)
                    .background(Color.bbLightBrown)
                    .font(.system(size: 25, weight: .bold))
            }
        }
    }
    
    struct ImageOverlayMath: View {
        
        let math:LocalizedStringKey = "math"
        
        var body: some View {
            ZStack {
                Text(math)
                    .padding(.top, 5)
                    .frame(width: 190)
                    .foregroundColor(.bbBlack)
                    .background(Color.bbLightBrown)
                    .font(.system(size: 25, weight: .bold))
            }
        }
    }
    
    struct ImageOverlayStory: View {
        
        let story:LocalizedStringKey = "story"
        
        var body: some View {
            ZStack {
                Text(story)
                    .padding(.top, 5)
                    .frame(width: 190)
                    .foregroundColor(.bbBlack)
                    .background(Color.bbLightBrown)
                    .font(.system(size: 25, weight: .bold))
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
