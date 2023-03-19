//
//  LatestView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import SwiftUI

struct LatestView: View {
    @StateObject var viewModel: LatestViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Latest")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Text("View all")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
                .padding(.top, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach($viewModel.latestItems) { $item in
                        VStack(alignment: .leading) {
                            Spacer(minLength: 136)
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
                            Text("$\(item.price ?? 0)")
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.bottom, -100)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                            
                            HStack {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.gray)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .font(.system(size: 24))
                                    .padding(.trailing, 6)
                            }
                            .padding(.leading, 100)
                            .padding(.bottom, 80)
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
                        .frame(width: 125, height: 150)
                        .background(Color.gray)
                        .cornerRadius(12)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView(viewModel: LatestViewModel())
    }
}
