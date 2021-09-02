//
//  PersistentStorage.swift
//  tableView
//
//  Created by Coditas on 02/09/21.
//

import Foundation
import CoreData

final class PersistentStorage{
    
    private init(){}
    static let shared = PersistentStorage()
    
    lazy var persistentContainer: NSPersistentContainer = {
         
         let container = NSPersistentContainer(name: "tableView")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
                
                 fatalError("Unresolved error \(error), \(error.userInfo)")
             }
         })
         return container
     }()

    lazy var context = persistentContainer.viewContext

      func saveContext () {
         if context.hasChanges {
             do {
                 try context.save()
                 print("savecontext data")
             } catch {
                 
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
             }
         }
     }

    
    
    
}
