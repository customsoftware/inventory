//
//  Home_InventoryApp.swift
//  Home Inventory
//
//  Created by Kenneth Cluff on 7/18/25.
//

import SwiftUI

@main
struct Home_InventoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

// The plan here is to load a view controller which will take input from the various views that tell it which view should be presented next. The input will come in the form of a struct which conforms to a protocol and that object will tell the controller which view to load and what the presentation mode should be.
