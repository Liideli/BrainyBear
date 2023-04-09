//
//  ContentView.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.7
    var body: some View {
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
                                Text("Info")
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
                                Text("Settings")
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
         
                VStack{
                    HStack {
                                   Button(action: {
                                       // Action for button 1
                                   }, label: {
                                       Text("Button 1")
                                   })
                                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                                   .padding()
                                   . background(Color.blue)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)

                                   Button(action: {
                                       // Action for button 2
                                   }, label: {
                                       Text("Button 2")
                                   })
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   . background(Color.green)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                               }
                               .frame(height: 50)

                               HStack {
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

                                   Button(action: {
                                       // Action for button 4
                                   }, label: {
                                       Text("Button 4")
                                   })
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   . background(Color.red)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                               }
                               .frame(height: 50)
                           }
                       }
                   }
            
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
