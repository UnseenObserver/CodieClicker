//
//  CodieClickerApp.swift
//  CodieClicker
//
//  Created by HPro2 on 5/5/25.
//

import SwiftUI

@main
struct CodieClickerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
