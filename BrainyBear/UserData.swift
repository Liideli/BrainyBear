//
//  UserData.swift
//  BrainyBear
//
//  Created by iosdev on 5.4.2023.
//

import Foundation
import SwiftUI
import CoreData

class DataController : ObservableObject {
    
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
    
    private lazy var managedContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()
    
    // MARK: - Methods
    
    func saveScore(_ coins: Int) {
        let entity = NSEntityDescription.entity(forEntityName: "Coin", in: managedContext)!
        let scoreObject = NSManagedObject(entity: entity, insertInto: managedContext)
        scoreObject.setValue(coins, forKey: "coins")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save coins. \(error), \(error.userInfo)")
        }
    }
    
    func fetchScore() -> Int? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Coin")
        fetchRequest.fetchLimit = 1
        
        do {
            let results = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            if let score = results.first?.value(forKey: "coins") as? Int {
                return score
            } else {
                return nil
            }
        } catch let error as NSError {
            print("Could not fetch coins. \(error), \(error.userInfo)")
            return nil
        }
    }
}




