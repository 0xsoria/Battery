//
//  NSManagedContext+Extensions.swift
//  Battery
//
//  Created by Gabriel Soria on 16/07/2022.
//

import CoreData

extension NSManagedObjectContext {
    func insertObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else { fatalError("Wrong object type") }
        return obj
    }

    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }
    
    func performChanges(block: @escaping () -> ()) async {
        await perform {
            block()
            _ = self.saveOrRollback()
        }
    }
}
