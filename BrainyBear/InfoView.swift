//
//  InfoView.swift
//  BrainyBear
//
//  Created by iosdev on 15.4.2023.
//

import SwiftUI

struct InfoView: View {
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
                            Text("About brainybear")
                                .font(
                                    .title
                                        .weight(.heavy))
                                .padding()
                        }
                        Group {
                            Text("Brainy Bear is an application for children and parents to make learning easy and engaging. The application is to be used under parental supervision. Application permissions required.")
                                .padding()
                            Divider()
                            Text("Features")
                                .font(.title)
                                .bold()
                            HStack{
                                Image(systemName: "map")
                                    .font(.system(size: 40))
                                    .padding()
                                Text("Map")
                                    .font(.system(size: 25))
                                Spacer()
                            }
                        }
                        Group {
                            HStack{
                                Text("Press on main view to view nearby playgrounds")
                                    .padding()
                                Divider()
                                Text("Requires location permissions. Never locate to playground without parental permission/supervision")
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
                                Text("Drawing")
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            HStack{
                                Text("Draw and save images with built in tools")
                            }
                        }
                        Group {
                            HStack{
                             Image(systemName: "books.vertical")
                             .font(.system(size: 40))
                             .padding()
                             Text("Stories")
                             .font(.system(size: 25))
                             Spacer()
                             }
                             HStack{
                             Text("Read or listen to multiple stories")
                             }
                        }
                        Group {
                            HStack{
                             Image(systemName: "plus.forwardslash.minus")
                             .font(.system(size: 40))
                             .padding()
                             Text("Math")
                             .font(.system(size: 25))
                             Spacer()
                             }
                             HStack{
                             Text("Learn math with random generated questions and earn coins")
                             }
                        }
                        Group {
                            HStack{
                             Image(systemName: "camera.viewfinder")
                             .font(.system(size: 40))
                             .padding()
                             Text("Alternate reality view")
                             .font(.system(size: 25))
                             Spacer()
                             }
                            HStack{
                                Text("View the virtual buddy Brainy Bear in alternative reality")
                                    .padding()
                                Divider()
                                Text("Requires camera permission")
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
