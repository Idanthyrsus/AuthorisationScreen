
import Foundation
import SwiftUI

enum AuthCoordinatorInput {
    case asRoot
    case fromSomePlace
}

enum AuthCoordinatorOutput {
    case authorised
}

final class AuthCoordinator: BaseCoordinator {

    var output: ((AuthCoordinatorOutput) -> Void)?

    private func loginPressed() {
        let factoryResult = AuthCoordinatorFactory.makeLoginView()
        factoryResult.module.output = { [weak self] output in
            switch output {
            case .authorized:
                self?.authCompleted()
            }
        }
        router.push(vc: factoryResult.view.toPresent)
    }

    private func authCompleted() {
        output?(.authorised)
    }
}

extension AuthCoordinator: InOutableProtocol {
    typealias InputType = AuthCoordinatorInput
    typealias OutputType = AuthCoordinatorOutput

    func perform(with input: AuthCoordinatorInput) {
        let factoryResult = AuthCoordinatorFactory.makeSigInView()
        factoryResult.module.output = { [weak self] output in
            switch output {
            case .loginPressed:
                self?.loginPressed()
            case .signInCompleted:
                self?.authCompleted()
            }
        }
        switch input {
        case .asRoot:
            router.push(vc: factoryResult.view.toPresent)
        case .fromSomePlace:
            router.setRoot(vc: factoryResult.view.toPresent)
        }
    }
}
