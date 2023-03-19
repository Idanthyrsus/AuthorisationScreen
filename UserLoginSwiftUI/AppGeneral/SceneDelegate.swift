

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var appCoordinator: AnyInOutable<Void, NilOutputOption>?
    
    @objc var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let navVc = UINavigationController()
        navVc.navigationBar.isHidden = true
        window?.rootViewController = navVc

        let router = ApplicationRouter(rootNavigationController: navVc)
        let appCoordinator = CoordinatorFactory.shared.makeAppCoordinator(router: router)
        self.appCoordinator = appCoordinator
        appCoordinator.perform(with: ())
    }
}

