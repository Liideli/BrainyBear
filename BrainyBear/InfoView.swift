//
//  InfoView.swift
//  BrainyBear
//
//  Created by iosdev on 15.4.2023.
//

import SwiftUI

struct InfoView: View {
    // Localized string keys
    let about:LocalizedStringKey = "about"
    let aboutText:LocalizedStringKey = "aboutText"
    let features:LocalizedStringKey = "features"
    let map:LocalizedStringKey = "map"
    let mapInstructions:LocalizedStringKey = "mapInstructions"
    let mapRequirements:LocalizedStringKey = "mapRequirements"
    let drawing:LocalizedStringKey = "drawing"
    let drawInstructions:LocalizedStringKey = "drawInstructions"
    let stories:LocalizedStringKey = "stories"
    let storiesInstructions:LocalizedStringKey = "storiesInstructions"
    let math:LocalizedStringKey = "math"
    let mathInstructions:LocalizedStringKey = "mathInstructions"
    let ARView:LocalizedStringKey = "ARView"
    let ARViewInstructions:LocalizedStringKey = "ARViewInstructions"
    let ARViewRequirements:LocalizedStringKey = "ARViewRequirements"
    var body: some View {
        Color.bbLightBrown
            .ignoresSafeArea()
            .overlay(
                ScrollView {
                    VStack{
                        Group {
                            Image(systemName: "info.circle")
                                .padding()
                                .font(.system(size: 80))
                                .foregroundColor(.bbBlack)
                                .cornerRadius(40)
                            Text(about)
                                .font(
                                    .title
                                        .weight(.heavy))
                                .padding()
                        }
                        Group {
                            Text(aboutText)
                                .padding()
                            Divider()
                            Text(features)
                                .font(.title)
                                .bold()
                            HStack{
                                Image(systemName: "map")
                                    .font(.system(size: 40))
                                    .padding()
                                Text(map)
                                    .font(.system(size: 25))
                                Spacer()
                            }
                        }
                        Group {
                            HStack{
                                Text(mapInstructions)
                                    .padding()
                                Divider()
                                Text(mapRequirements)
                                    .italic()
                                    .bold()
                                    .padding()
                            }
                        }
                        Group {
                            HStack{
                                Image(systemName: "paintbrush")
                                    .font(.system(size: 40))
                                    .padding()
                                Text(drawing)
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            HStack{
                                Text(drawInstructions)
                            }
                        }
                        Group {
                            HStack{
                             Image(systemName: "books.vertical")
                             .font(.system(size: 40))
                             .padding()
                             Text(stories)
                             .font(.system(size: 25))
                             Spacer()
                             }
                             HStack{
                             Text(storiesInstructions)
                             }
                        }
                        Group {
                            HStack{
                             Image(systemName: "plus.forwardslash.minus")
                             .font(.system(size: 40))
                             .padding()
                             Text(math)
                             .font(.system(size: 25))
                             Spacer()
                             }
                             HStack{
                             Text(mathInstructions)
                             }
                        }
                        Group {
                            HStack{
                             Image(systemName: "camera.viewfinder")
                             .font(.system(size: 40))
                             .padding()
                             Text(ARView)
                             .font(.system(size: 25))
                             Spacer()
                             }
                            HStack{
                                Text(ARViewInstructions)
                                    .padding()
                                Divider()
                                Text(ARViewRequirements)
                                    .italic()
                                    .bold()
                                    .padding()
                            }
                        }

                        Divider()
                    }
                })
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
