//
//  AuthViewModel.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/28/23.
//
import Foundation
import Firebase
import GoogleSignIn


class AuthViewModel: ObservableObject {
    @Published var errorMessage: String = ""
    
    
}


extension AuthViewModel {
    @MainActor
    func signInWithGoogle() async -> Bool {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No client ID found in Firebase configuration")
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene =  UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window =  windowScene.windows.first,
              let rootViewController =  window.rootViewController else {
            print("There is no root view controller!")
            return false
        }
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            
            let user = userAuthentication.user
            guard let idToken = user.idToken else { 
            let message = "ID token missing"
                print(message)
                self.errorMessage = message
                return false
//                AuthenticationError.tokenError(message: "ID token missing")
            }
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                           accessToken: accessToken.tokenString)
            
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            print("User \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknown")")
            return true
        }
        catch {
            print(error.localizedDescription)
            self.errorMessage = error.localizedDescription
            return false
        }
    }
}
