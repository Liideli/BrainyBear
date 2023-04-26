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
    
    // MARK: - Properties
    
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
    
    private lazy var mainContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    private lazy var backgroundContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.automaticallyMergesChangesFromParent = true
        return context
    }()
    
    // MARK: - Methods
    
    func saveScore(_ score: Int) {
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
            fetchRequest.fetchLimit = 1
            
            if let result = try? self.backgroundContext.fetch(fetchRequest) as? [NSManagedObject], let existingScore = result.first {
                existingScore.setValue(score, forKey: "coins")
            } else {
                let entity = NSEntityDescription.entity(forEntityName: "Coin", in: self.backgroundContext)!
                let scoreObject = NSManagedObject(entity: entity, insertInto: self.backgroundContext)
                scoreObject.setValue(score, forKey: "coins")
            }
            
            do {
                try self.backgroundContext.save()
            } catch let error as NSError {
                print("Could not save score. \(error), \(error.userInfo)")
            }
            
            self.mainContext.performAndWait {
                do {
                    try self.mainContext.save()
                } catch let error as NSError {
                    print("Could not save score to main context. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    func fetchScore() -> Int? {
        var coins: Int?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        fetchRequest.fetchLimit = 1
        
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
}





