//
//  SignInLogoView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 12.03.2023.
//

import SwiftUI

struct SignInLogoView: View {
    var googleImage = "Google-icon-vector-10"
    var googleText = "Sign in with Google"
    var appleLogo = "applelogo"
    var appleText = "Sign in with Apple"
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image(googleImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(10)
                Text(googleText)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            HStack {
                Image(systemName: appleLogo)
                    .font(.system(size: 28))
                    .frame(width: 20, height: 20)
                    .padding(10)
                Text(appleText)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
        }
    }
}
