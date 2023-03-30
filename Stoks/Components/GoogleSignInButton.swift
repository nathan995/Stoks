//
//  GoogleSignInButton.swift
//  Stoks
//
//  Created by Nathan Getachew on 3/29/23.
//

import SwiftUI

struct GoogleSignInButton: View {
    let onTap : ()->Void
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        Button {
            onTap()
        } label: {
            
            HStack(spacing : 10) {
                Spacer()
                Image("GoogleLogo")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text("Sign in with Google")
                    .font(.title3)
                    .foregroundColor(colorScheme == .light ? .white : .black)
                Spacer()
            }
            
            .padding(10)
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
}

struct Go_Previews :  PreviewProvider {
    
    static var previews: some View {
        GoogleSignInButton(onTap: {})
    }
}
