//
//  BrandsView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 13.03.2023.
//

import SwiftUI

struct BrandsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Brands")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Text("View all")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
                .padding(.top, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { item in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(Color(.init(white: 0.9, alpha: 1)))
                            .cornerRadius(12)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct BrandsView_Previews: PreviewProvider {
    static var previews: some View {
        BrandsView()
    }
}
