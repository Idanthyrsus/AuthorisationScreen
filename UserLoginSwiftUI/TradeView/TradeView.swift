//
//  TradeView.swift
//  UserLoginSwiftUI
//
//  Created by Alexander Korchak on 12.03.2023.
//

import SwiftUI
import Combine

struct TradeView: View {
    @State var text: String = ""
    @StateObject var viewModel: TradeViewModel
    @StateObject var latestViewModel: LatestViewModel
    @StateObject var flashViewModel: FlashSaleViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                HStack(alignment: .center) {
                    Image(systemName: "text.justify")
                        .imageScale(.medium)
                        .fontWeight(.bold)
                        .padding()
                    Text("Trade by bata")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(40)
                    VStack {
                        Image("Indian programmer")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .trailing)
                        .clipShape(Circle())
                        HStack {
                            Text("Location")
                                .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            Image(systemName: "chevron.down")
                                .imageScale(.small)
                                .fontWeight(.semibold)
                                .padding(EdgeInsets(top: 1, leading: -4, bottom: 1, trailing: 1))
                                .foregroundColor(.gray)
                        }
                    }
                }
               
               
                HStack {
                    TextField("What are you looking for?", text: $text)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.gray)
                    .frame(width: 300)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(4)
                .background(.thinMaterial)
                .cornerRadius(12)
                TradingCategoriesView()
                LatestView(viewModel: latestViewModel)
                FlashSaleView(viewModel: flashViewModel)
                BrandsView()
            }
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView(viewModel: TradeViewModel(), latestViewModel: LatestViewModel(), flashViewModel: FlashSaleViewModel())
    }
}

