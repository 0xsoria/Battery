//
//  Managed.swift
//  Battery
//
//  Created by Gabriel Soria on 16/07/2022.
//

import CoreData

protocol Managed: NSFetchRequestResult {
    static var entityName: String { get }
    static var defaultDescriptors: [NSSortDescriptor] { get }
}

extension Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }
    
    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultDescriptors
        return request
    }
}

extension Managed where Self: NSManagedObject {
    static var entityName: String {
        return entity().name!
    }
}
