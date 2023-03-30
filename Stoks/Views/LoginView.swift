//
//  LoginView.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/28/23.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing:30) {
            
            VStack(alignment: .leading,spacing: 10) {
                HStack{Spacer()}
                Text("Sign up")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Create an account, it takes less than a minute.")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            
            VStack(spacing:10) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                
                SignInButton(onTap: {})
            }
            
            Text("or")
            
            GoogleSignInButton( onTap: {
                Task {
                    await authViewModel.signInWithGoogle()
                }
            })
            GoogleSignInButton( onTap: {
                Task {
                    await authViewModel.signInWithGoogle()
                }
            })
            Spacer()
            HStack{
                Text("Already have an account?")
                Button("Login"){
                    
                }
                .fontWeight(.bold)
            }
            
        }
        .padding()
        .alert(isPresented: Binding<Bool>(get: {
            !authViewModel.errorMessage.isEmpty
        }, set: { _ in
            authViewModel.errorMessage = ""
        })) {
            Alert(title: Text("Error"), message: Text(authViewModel.errorMessage))
        }
    }
}
