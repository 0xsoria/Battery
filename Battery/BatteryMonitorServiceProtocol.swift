//
//  BatteryMonitorServiceProtocol.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 13/07/2022.
//

protocol BatteryMonitorService {
    var batteryLevel: Float { get }
    var batteryStatus: BatteryState { get }
}
