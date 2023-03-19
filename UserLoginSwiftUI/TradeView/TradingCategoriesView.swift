//
//  TradingCategoriesView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import SwiftUI

struct TradingCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Phones", imageName: "iphone.gen1"),
        .init(name: "Headphones", imageName: "headphones"),
        .init(name: "Games", imageName: "gamecontroller.fill"),
        .init(name: "Cars", imageName: "car.side.fill"),
        .init(name: "Furniture", imageName: "bed.double.fill"),
        .init(name: "Kids", imageName: "teddybear.fill"),
        
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 11) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 12) {
                        Image(systemName: category.imageName)
                            .frame(width: 46, height: 42)
                            .background(.thinMaterial)
                            .cornerRadius(26)
                        Text(category.name)
                            .font(.system(size: 8, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                    }.frame(width: 52)
                }
            }.padding(.horizontal)
        }
    }
}

struct TradingCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        TradingCategoriesView()
    }
}
