//
//  SettingsView.swift
//  BrainyBear
//
//  Created by iosdev on 23.4.2023.
//

import SwiftUI

struct SettingsView: View {
    
    // Localized string keys
    let settings:LocalizedStringKey = "settings"
    let changeParentalPassword:LocalizedStringKey = "changeParentalPassword"
    
    var body: some View {
        Color.bbLightBrown
            .ignoresSafeArea()
            .overlay(
                ScrollView {
                    VStack (alignment: .leading){
                        Text(settings)
                            .font(.largeTitle)
                            .padding()
                            .onTapGesture {
                                print("change password")
                            }
                        Divider()
                        HStack {
                            Text(changeParentalPassword)
                                .padding()
                            Spacer()
                            Image(systemName: "arrow.right")
                                .padding()
                        }
                        Divider()
                    }
                })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
