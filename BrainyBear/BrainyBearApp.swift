//
//  BrainyBearApp.swift
//  BrainyBear
//
//  Created by Roope Laine on 29.3.2023.
//

import SwiftUI
import CoreData

@main
struct BrainyBearApp: App {
    let persistenceController = PersistenceController.shared
     @StateObject private var shopDataController = ShopDataController()
    // Localized string keys
    let alertTitle:LocalizedStringKey = "alertTitle"
    let alertMessage:LocalizedStringKey = "alertMessage"
    @State private var showAlert = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.managedObjectContext, shopDataController.container.viewContext)
                .onAppear {
                    // Start a timer that fires every 10 seconds
                    Timer.scheduledTimer(withTimeInterval: 1800, repeats: true) { _ in
                        // Update the state to show the alert
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
        }
    }
}
