//
//  macOSBatteryLevelService.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 14/07/2022.
//

#if os(macOS)
final class macOSBatteryLevelService: BatteryMonitorService {

    var batteryLevel: Float {
        Float(batteryInfo?.charge ?? 0)
    }
    var batteryStatus: BatteryState {
        defineStatus()
    }
    private let batteryInfo: InternalBattery?
    
    init() {
        let batteryFinder = InternalFinder()
        self.batteryInfo = batteryFinder.getInternalBattery()
    }
    
    private func defineStatus() -> BatteryState {
        if batteryInfo?.isCharging ?? false {
            return .charging
        } else if batteryInfo?.isCharged ?? false {
            return .full
        } else if !(batteryInfo?.acPowered ?? true) {
            return .unplugged
        } else {
            return .unknown
        }
    }
}
#endif
