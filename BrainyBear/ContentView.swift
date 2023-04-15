//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.7
    let info:LocalizedStringKey = "info"
    let settings:LocalizedStringKey = "settings"
    let AR:LocalizedStringKey = "AR"
    let playground:LocalizedStringKey = "playground"
    let draw:LocalizedStringKey = "draw"
    let story:LocalizedStringKey = "story"
    let math:LocalizedStringKey = "math"

    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("BrainyBear")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.664, brightness: 0.45))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                Divider()
                VStack {
                    HStack {
                        Button(action: {
                            // Action for the left button
                        }, label: {
                            Text(info)
                                .frame(maxWidth: 30, maxHeight: 30)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        })
                        Spacer()
                        Button(action: {
                            // Action for the right button
                        }, label: {
                            Text(settings)
                                .frame(maxWidth: 30, maxHeight: 30)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        })
                    }
                    .padding()
                    Spacer()
                }
                
                VStack {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(.green).padding()
                        .padding(.leading)
                }
                VStack{
                    Image("cuteBear2").resizable()
                        .frame(width: 420, height: 420)
                }
                VStack {
                    NavigationLink(AR, destination: AugmentedRealityView())
                        .padding(10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
                VStack{
                    HStack {
                        NavigationLink(playground, destination: PlaygroundView())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            . background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        NavigationLink(draw, destination: CanvasView())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            . background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(height: 50)
                    
                    HStack {
                        NavigationLink(story, destination: StoryUI())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            . background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        NavigationLink(math, destination: MathGameView())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            . background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .frame(height: 50)
                }
            }
        }
    }
            
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
