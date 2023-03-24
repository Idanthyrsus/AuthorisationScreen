
import UIKit

class TabBarViewController: UITabBarController {
    
    let symbolConfig = UIImage.SymbolConfiguration(pointSize: 12, weight: .heavy)
    
    enum TabBarProperties {
        case house
        case heart
        case cartImage
        case messageImage
        case person
        
        var description: String {
            switch self {
            case .house:
                return "house"
            case .heart:
                return "HeartTab"
            case .cartImage:
                return "cart"
            case .messageImage:
                return "MessageTab"
            case .person:
                return "person"
            }
        }
    }
    
    private lazy var mainViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: MainViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.house.description, withConfiguration: self.symbolConfig)
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var favoriteViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: FavoriteViewController())
        controller.tabBarItem.image = UIImage(named: TabBarProperties.heart.description)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var cartViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: CartViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.cartImage.description, withConfiguration: self.symbolConfig)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var messagesViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: MessagesViewController())
        controller.tabBarItem.image = UIImage(named: TabBarProperties.messageImage.description)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var profileViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: ProfileViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.person.description, withConfiguration: self.symbolConfig)
        controller.navigationBar.prefersLargeTitles = false
        controller.navigationBar.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarUI()
        setViewControllers([mainViewController,
                            favoriteViewController,
                            cartViewController,
                            messagesViewController,
                            profileViewController],
                            animated: true)
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .gray
        UITabBar.appearance().isTranslucent = true
    }
    
    private func setupTabBarUI() {
        // Setup your colors and corner radius
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 24
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.tintColor = UIColor(red: 115/255, green: 114/255, blue: 151/255, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 144/255, green: 144/255, blue: 144/255, alpha: 1)
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
        }
    }
}

