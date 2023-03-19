
import Foundation
import UIKit

protocol Routable: AnyObject {
    func push(vc: UIViewController)
    func pop()
    func setRoot(vc: UIViewController)
}

final class ApplicationRouter {
    private weak var rootNavigationController: UINavigationController?

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
}

extension ApplicationRouter: Routable {
    func push(vc: UIViewController) {
        rootNavigationController?.pushViewController(vc, animated: true)
    }

    func pop() {
        rootNavigationController?.popViewController(animated: true)
    }

    func setRoot(vc: UIViewController) {
        rootNavigationController?.setViewControllers([vc], animated: true)
    }
}
