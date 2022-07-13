//
//  BatteryLevelService.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 12/07/2022.
//

import Foundation
#if os(iOS)
import UIKit
#endif

final class BatteryLevelService: ObservableObject {
    
    @Published var batteryLevel: Float = 0
    @Published var batteryStatus: BatteryState = .unknown
    private let service: BatteryMonitorService

    init(service: BatteryMonitorService) {
        self.service = service
        batteryLevel = service.batteryLevel
        batteryStatus = service.batteryStatus
        #if os(iOS)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(batteryLevelDidChange),
                                               name: UIDevice.batteryLevelDidChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(batteryStateDidChange),
                                               name: UIDevice.batteryStateDidChangeNotification,
                                               object: nil)
        #endif
    }

    @objc private func batteryLevelDidChange(_ notification: Notification) {
        batteryLevel = service.batteryLevel
    }
    
    @objc private func batteryStateDidChange(_ notification: Notification) {
        batteryStatus = service.batteryStatus
    }
}
