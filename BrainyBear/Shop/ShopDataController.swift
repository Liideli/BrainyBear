//
//  ShopDataController.swift
//  BrainyBear
//
//  Created by iosdev on 27.4.2023.
//

import Foundation
import CoreData

class ShopDataController: ObservableObject {
    let container = NSPersistentContainer(name: "ShopData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
