//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mathGame = MathGameViewModel()
    var body: some View {
        NavigationView {
            Color.bbLightBrown
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        /*                HStack{
                         Text("BrainyBear")
                         .font(.headline)
                         .fontWeight(.bold)
                         .foregroundColor(Color(hue: 1.0, saturation: 0.664, brightness: 0.45))
                         .multilineTextAlignment(.center)
                         .frame(maxWidth: .infinity)
                         .padding()
                         }
                         Divider() */
                        HStack {
                            Button(action: {
                                // Action for the left button
                            }, label: {
                                Image(systemName: "info.circle")
                                    .padding()
                                    .font(.system(size: 25))
                                    .background(Color.bbLilac, in: Capsule())
                                    .foregroundColor(.bbBlack)
                                    .cornerRadius(40)
                                    .padding()
                            })
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
                            Button(action: {
                                // Action for the right button
                            }, label: {
                                Image(systemName: "gearshape.fill")
                                    .padding()
                                    .font(.system(size: 25))
                                    .background(Color.bbLilac, in: Capsule())
                                    .foregroundColor(.bbBlack)
                                    .cornerRadius(40)
                                    .padding()
                            })
                        }
                        Spacer()
                        VStack{
                            Image("cuteBear2").resizable()
                                .background(Color.bbLilac, in: Capsule())
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding()
                            NavigationLink {
                                AugmentedRealityView()
                            } label: {
                                Image(systemName: "camera.viewfinder")
                            }
                            .padding(10)
                            .foregroundColor(Color.black)
                            .font(.system(size: 35))
                            .background(Color.bbLilac, in: Capsule())
                            .cornerRadius(10)
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
                                        Text("Map")
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
