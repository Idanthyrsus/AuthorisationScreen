
import SwiftUI
import Combine

enum TradeViewInput {
    case `default`
}

enum TradeViewOutput {
    case `default`
    case logout
}

class TradeViewModel: InOutableProtocol, ObservableObject {

    typealias InputType = TradeViewInput
    typealias OutputType = TradeViewOutput

    var output: ((TradeViewOutput) -> Void)?

    func tapProfileCell(category: ProfileDataSource) {
        switch category.typeId {
        case .logout:
            output?(.logout)
        default:
            break
        }
    }
}
