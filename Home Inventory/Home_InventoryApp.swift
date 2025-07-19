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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
