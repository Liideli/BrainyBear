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
    let coinsManager = CoinsManager(context: NSManagedObjectContext)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coinsManager)
        }
    }
}
