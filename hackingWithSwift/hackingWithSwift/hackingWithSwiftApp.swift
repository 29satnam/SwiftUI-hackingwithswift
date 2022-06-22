//
//  hackingWithSwiftApp.swift
//  hackingWithSwift
//
//  Created by Satnam on 19/06/22.
//

import SwiftUI

@main
struct hackingWithSwiftApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
