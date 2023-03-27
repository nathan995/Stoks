//
//  StoksApp.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/26/23.
//

import SwiftUI

@main
struct StoksApp: App {
    let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
