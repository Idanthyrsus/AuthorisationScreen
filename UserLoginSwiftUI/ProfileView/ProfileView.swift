
import SwiftUI

struct ProfileView: View {
    
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage = UIImage(named: "Indian programmer")!
    @State private var selectedCategory: ProfileDataSource? = nil

    @StateObject var profileViewModel: TradeViewModel

    let customBackroundColor = CGColor(red: 245/255, green: 245/255, blue: 1, alpha: 1)
    var body: some View {
        Color(customBackroundColor)
            .overlay {
                Color(customBackroundColor)
                    .overlay {
                        VStack {
                            Image(uiImage: avatarImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80, alignment: .top)
                                .clipShape(Circle())
                            Button {
                                isShowingPhotoPicker = true
                            } label: {
                                Text("Change photo")
                                    .font(.custom("Montserrat", size: 12))
                                    .foregroundColor(.gray)
                            }
                            Text("Satria Adhi Pradana")
                                .font(.system(size: 18))
                                .padding(.top, 12)
                                .fontWeight(.bold)
                            Button(role: .none, action: {

                            }) {
                                Label("Upload item", systemImage: "square.and.arrow.up")
                            }
                            .imageScale(.medium)
                            .fontWeight(.bold)
                            .frame(width: 360, height: 50)
                            .foregroundColor(.white)
                            .background(Color(CGColor(red: 73/255, green: 15/255, blue: 234/255, alpha: 1)))
                            .cornerRadius(16)
                            .padding(.top, 30)
                            Spacer()
                            List {
                                ForEach(ProfileDataSource.dataSourceArray) { category in
                                    CustomCellView(item: category)
                                        .frame(height: 37)
                                        .onTapGesture {
                                            profileViewModel.tapProfileCell(category: category)
                                        }
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color(customBackroundColor))
                            }
                            .frame(width: 420)
                        }
                        .offset(CGSize(width: 0, height: 32))
                        .navigationTitle("Profile")
                        .navigationBarTitleDisplayMode(.inline)
                        Spacer()
                    }
                    .sheet(isPresented: $isShowingPhotoPicker) {
                        PhotoPicker(avatarImage: $avatarImage)
                    }
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileViewModel: TradeViewModel())
    }
}
