
import Foundation

class BaseCoordinator {

    let router: Routable

    private var childCoordinators: [AnyObject] = []

    init(router: Routable) {
        self.router = router
    }

    func addChild(_ coordinator: AnyObject) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: AnyObject) {
        childCoordinators.removeAll { $0 === coordinator }
    }

    func removeAll() {
        childCoordinators.removeAll()
    }
}
