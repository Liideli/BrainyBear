//
//  UserData.swift
//  BrainyBear
//
//  Created by iosdev on 5.4.2023.
//

import Foundation
import SwiftUI
import CoreData

import CoreData

class DataController {
    
    // shared property to access the object in multiple views
    static let shared = DataController()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // main context to the application
    private lazy var mainContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    // background context of the application to save to. The core data actions are saved here to allow performing actions when navigating between views.
    private lazy var backgroundContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    // Saves the score to the Core Data store
    func saveScore(_ coins: Int) {
        
        // Perform the Core Data operation on the background context
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }
            
            // Create a fetch request to check if a Coin entity already exists
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
            fetchRequest.fetchLimit = 1
            
            if let result = try? self.backgroundContext.fetch(fetchRequest) as? [NSManagedObject], let existingScore = result.first {
                // If a Score entity exists, update its score value
                existingScore.setValue(coins, forKey: "coins")
            } else {
                // If a Score entity does not exist, create a new one and set its score value
                let entity = NSEntityDescription.entity(forEntityName: "Coin", in: self.backgroundContext)!
                let scoreObject = NSManagedObject(entity: entity, insertInto: self.backgroundContext)
                scoreObject.setValue(coins, forKey: "coins")
            }
            
            // Save the background context
            do {
                try self.backgroundContext.save()
            } catch let error as NSError {
                print("Could not save coins to background context. \(error), \(error.userInfo)")
            }
            
            // Save changes to the main context
            self.mainContext.performAndWait {
                do {
                    try self.mainContext.save()
                } catch let error as NSError {
                    print("Could not save coins to main context. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    // Fetches the score from the Core Data store
    func fetchScore() -> Int? {
        var coins: Int?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        fetchRequest.fetchLimit = 1
        
        // Perform the Core Data operation on the background context
        backgroundContext.performAndWait {
            do {
                let results = try backgroundContext.fetch(fetchRequest) as! [NSManagedObject]
                if let fetchedScore = results.first?.value(forKey: "coins") as? Int {
                    coins = fetchedScore
                }
            } catch let error as NSError {
                print("Could not fetch coins. \(error), \(error.userInfo)")
            }
        }
        return coins
    }
    
    func saveStoreItem(_ name: String, price: Int, id: UUID) {
        
        // Perform the Core Data operation on the background context
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }

                // If a Score entity does not exist, create a new one and set its score value
                let entity = NSEntityDescription.entity(forEntityName: "StoreItem", in: self.backgroundContext)!
                let storeObject = NSManagedObject(entity: entity, insertInto: self.backgroundContext)
                storeObject.setValue(name, forKey: "name")
                storeObject.setValue(price, forKey: "price")
                storeObject.setValue(id, forKey: "id")
            
            // Save the background context
            do {
                try self.backgroundContext.save()
            } catch let error as NSError {
                print("Could not save coins to background context. \(error), \(error.userInfo)")
            }
            
            // Save changes to the main context
            self.mainContext.performAndWait {
                do {
                    try self.mainContext.save()
                } catch let error as NSError {
                    print("Could not save coins to main context. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    // Fetches the items from the Core Data store
    func fetchStoreItems() -> Array<Any>? {
        var items: Array<Any>?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StoreItem")
        
        // Perform the Core Data operation on the background context
        backgroundContext.performAndWait {
            do {
                let results = try backgroundContext.fetch(fetchRequest) as! [NSManagedObject]
                if let fetchedItems = results as Array<Any>? {
                    items = fetchedItems
                }
                items = results
            } catch let error as NSError {
                print("Could not fetch items. \(error), \(error.userInfo)")
            }
        }
        return items
    }
}





