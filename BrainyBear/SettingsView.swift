//
//  SettingsView.swift
//  BrainyBear
//
//  Created by Roope Laine on 16.4.2023.
//

import SwiftUI
import Foundation

struct SettingsView: View {
    @EnvironmentObject var languageSettings: LanguageSettings
    @State var currentLanguage: String // Use @State to track the current language

    var body: some View {
        VStack {
            Color.bbLightBrown
            Text("Current Language: \(languageSettings.currentLanguage)")
                .padding()

            Button(action: {
                languageSettings.setLanguage("en")
            }) {
                Text("English")
                    .padding()
            }.background(Color.bbBabyBlue)
                .foregroundColor(.white)
                .cornerRadius(10)

            Button(action: {
                languageSettings.setLanguage("fi")
            }) {
                Text("Finnish")
                    .padding()
            }.background(Color.bbBabyBlue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .onReceive(languageSettings.$currentLanguage, perform: { language in
            currentLanguage = languageSettings.currentLanguage
        })
    }
}


class LanguageSettings: ObservableObject {
    @Published var currentLanguage: String

    init(initialLanguage: String) {
        self.currentLanguage = initialLanguage
    }

    func setLanguage(_ language: String) {
        self.currentLanguage = language
    }
}

class LocalizationManager {
    static let shared = LocalizationManager()

    private init() {}

    func localizedString(forKey key: String, language: String) -> String {
        // Load the appropriate Localizable.swift file based on the language
        if let localizedFilePath = Bundle.main.path(forResource: language, ofType: "lproj"),
           let localizedBundle = Bundle(path: localizedFilePath),
           let localizedString = localizedBundle.localizedString(forKey: key, value: nil, table: nil) as String? {
            return localizedString
        } else {
            // If localized string is not found for the current language, fall back to the base language
            return Bundle.main.localizedString(forKey: key, value: nil, table: nil)
        }
    }
}


