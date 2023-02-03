//
//  ImenuApp.swift
//  Imenu
//
//  Created by Felipe Silva de Borba on 31/01/23.
//

import SwiftUI

@main
struct ImenuApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
