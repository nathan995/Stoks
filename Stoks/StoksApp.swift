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
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var authState = AuthState()
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(authViewModel)
                .environmentObject(authState)
        }
    }
}
