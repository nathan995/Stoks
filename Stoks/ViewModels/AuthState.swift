//
//  AuthState.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/29/23.
//

import SwiftUI
import Firebase

class AuthState: ObservableObject {
    @Published var user: User?
    @Published var isLoggedIn = false
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.user = user
                self.isLoggedIn = true
            } else {
                self.user = nil
                self.isLoggedIn = false
            }
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
