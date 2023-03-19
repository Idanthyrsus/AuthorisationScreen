
import Foundation
import SwiftUI

typealias TradeViewResult = ModuleFactoryResult<TradeViewInput, TradeViewOutput>

final class AppModulesFactory {
    static func makeTradeView() -> TradeViewResult {
        let viewModel = TradeViewModel()

        let view = TradeHomeView(viewModel: viewModel,
                                 latestViewModel: LatestViewModel(),
                                 flashViewModel: FlashSaleViewModel())

        let presentable = UIHostingController(rootView: view)
        return (module: AnyInOutable(viewModel), view: presentable)
    }
}
