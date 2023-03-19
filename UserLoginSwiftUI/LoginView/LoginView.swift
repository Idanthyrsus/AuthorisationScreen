
import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView: View {

    @StateObject var viewModel: LoginViewModel

    var body: some View {
        NavigationView {
            Color(CGColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1))
                .overlay {
                    ZStack {
                        VStack {
                            HStack {
                                Text("Welcome back")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 30))
                                    .frame(width: 360, height: 120)
                            }
                            .padding(.bottom, 30)
                            
                            HStack {
                                
                                TextField("First name",
                                          text: $viewModel.firstName)
                            }
                            .frame(width: 310, height: 10)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(18)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 25)
                            HStack {
                                if viewModel.showPassword {
                                    TextField("Password",
                                              text: $viewModel.password)
                                } else {
                                    SecureField("Password",
                                                text: $viewModel.password)
                                    
                                }
                                
                                Button(action: { viewModel.showPassword.toggle()}) {
                                    
                                    Image(systemName: viewModel.showPassword ? "eye" : "eye.slash")
                                        .foregroundColor(.secondary)
                                    
                                }
                            }
                            .frame(width: 310, height: 10)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(18)
                        }
                        .padding()
                        
                        HStack {
                            Button {
                                viewModel.loginPressed()
                            } label: {
                                Text("Login")
                                    .frame(width: 360, height: 50)
                                    .foregroundColor(.white)
                                    .background(Color(CGColor(red: 73/255, green: 15/255, blue: 234/255, alpha: 1)))
                                    .cornerRadius(18)
                            }
                            .offset(CGSize(width: 0, height: 230))
                            .padding()
                            
                        }
                        .padding(.bottom, -80)
                        
                    }
                    .offset(CGSize(width: 0, height: -150))
                }
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}

