

import Foundation
import SwiftUI

enum NilOutputOption {
    case none
}

final class AppCoordinator: BaseCoordinator {

    typealias StartOption = Void
    typealias OutputOption = NilOutputOption

    var output: ((NilOutputOption) -> Void)?

    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(router: Routable, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
    }

    // MARK: - Private methods

    private func showTradeView() {
        let factoryResult = AppModulesFactory.makeTradeView()
        factoryResult.module.output = { [weak self] output in
            switch output {
            case .default:
                break
            case .logout:
                self?.showSignIn(fromRoot: false)
            }
        }
        router.setRoot(vc: factoryResult.view.toPresent)
    }

    private func showSignIn(fromRoot isFromRoot: Bool) {
        let authCoordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        addChild(authCoordinator)
        let inputType: AuthCoordinatorInput = isFromRoot ? .asRoot : .fromSomePlace
        authCoordinator.perform(with: inputType)
        authCoordinator.output = { [weak self] coordinatorOutput in
            switch coordinatorOutput {
            case .authorised:
                self?.showTradeView()
                self?.removeChild(authCoordinator)
            }
        }
    }
}

// MARK: - Coordinator

extension AppCoordinator: InOutableProtocol {

    func perform(with input: Void) {
        showSignIn(fromRoot: true)
    }
}
