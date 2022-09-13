//
//  SmartHome_betaApp.swift
//  SmartHome_beta
//
//  Created by vulcan on 29/8/2565 BE.
//

import SwiftUI

@main
struct SmartHome_betaApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(network)
        }
    }
}
