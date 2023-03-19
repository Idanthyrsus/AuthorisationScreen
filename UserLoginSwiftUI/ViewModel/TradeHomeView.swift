
import Foundation

import SwiftUI
import Combine

enum TabType: String {
    case home
    case profile

    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        }
    }
}

struct TradeHomeView: View {
    @StateObject var viewModel: TradeViewModel
    @StateObject var latestViewModel: LatestViewModel
    @StateObject var flashViewModel: FlashSaleViewModel

    @State private var selectedTab: TabType = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            TradeView(viewModel: viewModel,
                      latestViewModel: latestViewModel,
                      flashViewModel: flashViewModel)
            .tabItem {
                Image(systemName: TabType.home.systemImageName)
                    .padding()
                    .font(Font.title2.weight(.bold))
            }.onTapGesture {
                selectedTab = .home
            }
            ProfileView(profileViewModel: viewModel)
                .tabItem {
                    Image(systemName: TabType.profile.systemImageName)
                        .padding()
                        .font(Font.title2.weight(.bold))
                    Text("")
                }.onTapGesture {
                    selectedTab = .profile
                }
        }
        .accentColor(.black)
    }

//    func getTabColor(forTabType tabType: TabType) -> Color {
//        switch selectedTab {
//        case .home:
//            switch tabType {
//            case .home:
//                return .black
//            case .profile:
//                return .gray
//            }
//        case .profile:
//            switch tabType {
//            case .home:
//                return .gray
//            case .profile:
//                return .black
//            }
//        }
//    }
}
