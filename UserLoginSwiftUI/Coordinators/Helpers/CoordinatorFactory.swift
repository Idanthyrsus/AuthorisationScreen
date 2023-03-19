
import Foundation
import UIKit

typealias CoordinatorFactoryResult<Input, Output> = AnyInOutable<Input, Output>

protocol CoordinatorFactoryProtocol: AnyObject {
    func makeAppCoordinator(router: Routable) -> CoordinatorFactoryResult<Void, NilOutputOption>
    func makeAuthCoordinator(router: Routable) -> CoordinatorFactoryResult<AuthCoordinatorInput, AuthCoordinatorOutput>
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    static let shared = CoordinatorFactory()
    private init() {}

    func makeAppCoordinator(router: Routable) -> CoordinatorFactoryResult<Void, NilOutputOption> {
        return CoordinatorFactoryResult(AppCoordinator(router: router, coordinatorFactory: self))
    }

    func makeAuthCoordinator(router: Routable) -> CoordinatorFactoryResult<AuthCoordinatorInput, AuthCoordinatorOutput> {
        return CoordinatorFactoryResult(AuthCoordinator(router: router))
    }
}
