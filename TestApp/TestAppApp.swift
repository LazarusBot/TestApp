//
//  TestAppApp.swift
//  TestApp
//
//  Created by Max Prx on 13/04/2023.
//

import SwiftUI

@main
struct TestAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
