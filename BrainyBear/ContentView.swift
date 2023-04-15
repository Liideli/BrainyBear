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
                }
                VStack{
                    HStack {
                        NavigationLink("Playground", destination: PlaygroundView())
                            .frame(maxWidth: 175, maxHeight: 175)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        Button(action: {
                            // Action for button 3
                        }, label: {
                            Text("Button 3")
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        . background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(height: 50)
                    
                    HStack {
                        NavigationLink("Story", destination: StoryUI())
                            .frame(maxWidth: 175, maxHeight: 175)
                            .padding()
                            . background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        NavigationLink("4+4", destination: MathGameView())
                            .frame(maxWidth: 175, maxHeight: 175)
                            .padding()
                            . background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(height: 50)
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
