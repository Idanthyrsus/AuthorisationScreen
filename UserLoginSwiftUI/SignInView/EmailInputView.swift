//
//  EmailInputView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 12.03.2023.
//

import SwiftUI
import Combine

struct EmailInputView: View {
    var placeholder: String = "Email"
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.emailAddress)
            .onReceive(Just(text)) { newValue in
                let validString = newValue.filter { "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$".contains($0)
                }
                if validString != newValue {
                    self.text = validString
                }
            }
    }
}
