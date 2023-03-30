//
//  SignInButton.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/29/23.
//

import SwiftUI

struct SignInButton: View {
    let onTap : ()->Void
    
    var body: some View {
        
        Button {
            onTap()
        } label: {
            
            HStack(spacing : 10) {
                Spacer()
                
                Text("Sign in")
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Spacer()
            }
            
            .padding(10)
        }
        .buttonStyle(.borderedProminent)
        .tint(.accentColor)
    }
}
