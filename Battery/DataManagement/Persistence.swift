//
//  Persistence.swift
//  Battery
//
//  Created by Gabriel Soria on 16/07/2022.
//

import CoreData

class Persistence<C: NSFetchRequestResult> {
    
    let fechedResultsController: NSFetchedResultsController<C>
    let container: NSPersistentContainer
    
    init(_ storageType: StorageType = .persistent,
         containerName: String,
         fetchRequest: NSFetchRequest<C>) {
        let storage: StorageType
        #if MOCK || DEBUG
        storage = .inMemory
        #else
        storage = storageType
        #endif
        
        self.container = NSPersistentCloudKitContainer(name: containerName)
        self.container.viewContext.automaticallyMergesChangesFromParent = true

        if storage == .inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [description]
        }
        self.container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Failed to load store \(error!)")
            }
        }

        self.fechedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: container.viewContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
    }
}
