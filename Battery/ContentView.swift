//
//  ContentView.swift
//  Battery
//
//  Created by Gabriel Soria Souza on 12/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var service = BatteryLevelService()
    
    var body: some View {
        VStack {
            ProgressView(value: service.batteryLevel)
                .foregroundColor(.blue)
            Text("Status is \(service.batteryStatus.rawValue)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
