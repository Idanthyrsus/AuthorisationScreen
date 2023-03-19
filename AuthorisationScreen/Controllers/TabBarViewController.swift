
import UIKit

class TabBarViewController: UITabBarController {
    
    enum TabBarProperties {
        case house
        case home
        case heart
        case favorite
        case cartImage
        case cart
        case messageImage
        case message
        case person
        case profile
        
        var description: String {
            switch self {
            case .house:
                return "house.fill"
            case .home:
                return "Home"
            case .heart:
                return "heart.fill"
            case .favorite:
                return "Favorite"
            case .cartImage:
                return "cart"
            case .cart:
                return "Cart"
            case .messageImage:
                return "message"
            case .message:
                return "Messages"
            case .person:
                return "person"
            case .profile:
                return "Profile"
            }
        }
    }
    
    private lazy var mainViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: MainViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.house.description)
        controller.tabBarItem.title = TabBarProperties.home.description
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var favoriteViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: FavoriteViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.heart.description)
        controller.tabBarItem.title = TabBarProperties.favorite.description
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var cartViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: CartViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.cartImage.description)
        controller.tabBarItem.title = TabBarProperties.cart.description
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var messagesViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: MessagesViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.messageImage.description)
        controller.tabBarItem.title = TabBarProperties.message.description
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.backgroundColor = .white
        return controller
    }()
    
    private lazy var profileViewController: UINavigationController = {
        let controller = UINavigationController(rootViewController: ProfileViewController())
        controller.tabBarItem.image = UIImage(systemName: TabBarProperties.person.description)
        controller.tabBarItem.title = TabBarProperties.profile.description
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
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
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

