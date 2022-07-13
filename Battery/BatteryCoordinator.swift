//
//  BatteryCoordinator.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 13/07/2022.
//

import Foundation

protocol BatteryPersistence {
}


final class BatteryCoordinator {
    
    private let persistenceStore: BatteryPersistence
    private let monitorService: BatteryMonitorService
    
    init(persistenceStore: BatteryPersistence,
         monitorService: BatteryMonitorService) {
        self.persistenceStore = persistenceStore
        self.monitorService = monitorService
    }
    
    
}
