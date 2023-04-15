//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    @ObservedObject var mathGame = MathGameViewModel()
    var body: some View {
        NavigationView {
            Color.bbLightBrown
                .ignoresSafeArea()
                .overlay(
                    VStack {
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
                                Text("💰 \(mathGame.currentUser.getCoins())")
                                    .foregroundColor(Color.bbBlack)
                                    .padding()
                                    .background(Color.bbLilac, in: Capsule())
                                    .shadow(radius: 5)
                                    .font(.custom("Verdana", fixedSize: 25))
                                    .padding()
                            }
                            Spacer()
                            NavigationLink {
                                MathGameView()
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .padding()
                                    .font(.system(size: 25))
                                    .background(Color.bbLilac, in: Capsule())
                                    .foregroundColor(.bbBlack)
                                    .padding()
                            }
                        }
                        Spacer()
                        VStack{
                            /*Image("cuteBear2").resizable()
                                .background(Color.bbLilac, in: Capsule())
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding()*/
                            SceneView(scene: SCNScene(named: "teddy.dae"), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                                .padding()
                                .shadow(radius: 15)
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
                            
                            HStack {
                                NavigationLink{
                                    PlaygroundView()
                                } label: {
                                    VStack {
                                        Image(systemName: "map")
                                            .font(.system(size: 60))
                                        Text("Map")
                                            .font(.system(size: 25))
                                    }
                                }
                                .frame(width: 150, height: 150 )
                                .background(Color.bbBabyBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                NavigationLink{
                                    PlaygroundView()
                                } label: {
                                    VStack {
                                        Image(systemName: "paintbrush")
                                            .font(.system(size: 60))
                                        Text("Draw")
                                            .font(.system(size: 25))
                                    }
                                }
                                .frame(width: 150, height: 150 )
                                .background(Color.bbBabyBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            HStack {
                                NavigationLink{
                                    StoryUI()
                                } label: {
                                    VStack {
                                        Image(systemName: "books.vertical")
                                            .font(.system(size: 60))
                                        Text("Story")
                                            .font(.system(size: 25))
                                    }
                                }
                                .frame(width: 150, height: 150 )
                                .background(Color.bbBabyBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                
                                NavigationLink{
                                    MathGameView()
                                } label: {
                                    VStack {
                                        Image(systemName: "plus.forwardslash.minus")
                                            .font(.system(size: 60))
                                        Text("Math")
                                            .font(.system(size: 25))
                                    }
                                }
                                .frame(width: 150, height: 150 )
                                .background(Color.bbBabyBlue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
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
