//
//  ContentView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 12.03.2023.
//

import SwiftUI

struct SignInView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @StateObject var viewModel: SignInViewModel
    var body: some View {
        Color(CGColor(red: 245/255, green: 245/255, blue: 1, alpha: 1))
            .overlay {
                NavigationView {
                    Color(CGColor(red: 245/255, green: 245/255, blue: 1, alpha: 1))
                        .overlay {
                            VStack(spacing: 30) {
                                Text("Sign in")
                                    .fontWeight(.bold)
                                    .font(.system(size: 30))
                                    .frame(width: 300, height: 120)
                                TextField("First name", text: $firstName)
                                    .frame(width: 310, height: 10, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(18)
                                TextField("Last name", text: $lastName)
                                    .frame(width: 310, height: 10, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(18)
                                
                                EmailInputView(placeholder: "Email", text: $viewModel.email)
                                    .onChange(of: viewModel.email, perform: onEmailInputChanged)
                                    .cornerRadius(12)
                                    .frame(width: 310, height: 10, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(18)
                                Button {
                                    viewModel.signIn()
                                } label: {
                                    Text("Sign in")
                                        .fontWeight(.bold)
                                        .frame(width: 360, height: 50)
                                        .foregroundColor(.white)
                                        .background(Color(CGColor(red: 73/255, green: 15/255, blue: 234/255, alpha: 1)))
                                        .cornerRadius(16)
                                    
                                }
                                .padding()
                                HStack(spacing: -20) {
                                    Text("Already have an account?")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 6)
                                    Button {
                                        viewModel.loginPressed()
                                    } label: {
                                        Text("Log in")
                                            .font(.system(size: 14))
                                            .foregroundColor(.blue)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .offset(CGSize(width: 0, height: -35))
                                SignInLogoView()
                            }
                        }
                    
                        .offset(CGSize(width: 0, height: -40))
                }
            }
    }
    
    private func onEmailInputChanged(changedEmail: String) {
        print("onEmailInputChanged: \(changedEmail) ")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}


