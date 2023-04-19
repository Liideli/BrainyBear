//
//  UserData.swift
//  BrainyBear
//
//  Created by iosdev on 5.4.2023.
//

import Foundation
import SwiftUI
import CoreData

/* struct User {
    @AppStorage("COINS_KEY") var savedCoins = 0
    
    init(savedCoins: Int = 0) {
        self.savedCoins = savedCoins
    }
    
    func modifyCoins() {
        self.savedCoins += 50
        print("\(self.savedCoins)")
    }
    
    func getCoins () -> Int {
        return self.savedCoins
    }
}
*/

import CoreData

class CoinsManager : ObservableObject {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    // Save coins to Core Data
    func saveCoins(_ coins: Int) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        do {
            let results = try context.fetch(request)
            if let coinsEntity = results.first as? NSManagedObject {
                coinsEntity.setValue(coins, forKey: "coins")
            } else {
                let coinsEntity = NSEntityDescription.insertNewObject(forEntityName: "Coin", into: context)
                coinsEntity.setValue(coins, forKey: "coins")
            }
            try context.save()
        } catch let error {
            print("Could not save coins. \(error)")
        }
    }

    // Retrieve coins from Core Data
    func getCoins() -> Int {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Coins")
        do {
            let results = try context.fetch(request)
            if let coinsEntity = results.first as? NSManagedObject {
                return coinsEntity.value(forKey: "coins") as? Int ?? 0
            }
        } catch let error {
            print("Could not fetch coins. \(error)")
        }
        return 0
    }
}



