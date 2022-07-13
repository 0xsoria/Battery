//
//  iOSBatteryLevelService.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 13/07/2022.
//


#if os(iOS)

import UIKit

final class iOSBatteryLevelService: BatteryMonitorService {

    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }

    var batteryLevel: Float {
        UIDevice.current.batteryLevel
    }

    var batteryStatus: BatteryState {
        switch UIDevice.current.batteryState {
        case .unplugged:
            return .unplugged
        case .full:
            return .full
        case .charging:
            return .charging
        case .unknown:
            return .unknown
        @unknown default:
            return .unknown
        }
    }
}
#endif
