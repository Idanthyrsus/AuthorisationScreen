
import UIKit

class TabBarViewController: UITabBarController {
    
    let symbolConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .heavy)
    
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
                return "heart"
            case .cartImage:
                return "cart"
            case .messageImage:
                return "bubble.left"
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
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.heart.description, withConfiguration: self.symbolConfig)
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
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.messageImage.description, withConfiguration: self.symbolConfig)
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
      //  self.tabBar.frame = CGRect(x: 0, y: 0, width: 340, height: 100)
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
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .systemGray6
        
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

