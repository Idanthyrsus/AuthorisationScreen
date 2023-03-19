//
//  FlashSaleView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    @StateObject var viewModel: FlashSaleViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Flash Sale")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Text("View all")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
                .padding(.top, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach($viewModel.flashItems) { $item in
                        VStack {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(item.category ?? "Undefined category")
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .background(.thinMaterial)
                                    .foregroundColor(.black)
                                    .cornerRadius(12)
                                    .padding(.bottom, 5)
                                    .padding(.leading)
                                Text(item.name ?? "Undefined name")
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .foregroundColor(.white)
                                HStack {
                                    Text("$\(item.price ?? 0)")
                                        .font(.system(size: 12, weight: .semibold))
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "heart.circle")
                                        .foregroundColor(.gray)
                                        .background(.white)
                                        .clipShape(Circle())
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 28))
                                        .padding(.bottom, 4)
                                        .background(.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        .background(content: {
                            if let stringURL = item.imageURL {
                                AsyncImage(url: URL(string: stringURL), scale: 1.0)
                                    .scaledToFill()
                                    .padding(.horizontal, 0)
                            } else {
                                Image("samsung")
                                    .resizable()
                                    .scaledToFill()
                                    .padding(.horizontal, 0)
                            }
                        })
                        .frame(width: 180, height: 200)
                        .background(.gray)
                        .cornerRadius(12)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView(viewModel: FlashSaleViewModel())
    }
}
