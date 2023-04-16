//
//  BrainyBearApp.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI

@main
struct BrainyBearApp: App {
    @StateObject var languageSettings = LanguageSettings(initialLanguage: "en") // Create an instance of LanguageSettings as an ObservableObject
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(languageSettings)
        }
    }
}
