//
//  watchOSBatteryLevelService.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 13/07/2022.
//

#if os(watchOS)
import WatchKit

final class watchOSBatteryLevelService: BatteryMonitorService {
    var batteryLevel: Float {
        WKInterfaceDevice.current().batteryLevel
    }
    
    var batteryStatus: BatteryState {
        switch WKInterfaceDevice.current().batteryState {
        case .unknown:
            return .unknown
        case .charging:
            return .charging
        case .full:
            return .full
        case .unplugged:
            return .unplugged
        @unknown default:
            return .unknown
        }
    }
    
    init() {
        WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
    }
}
#endif
