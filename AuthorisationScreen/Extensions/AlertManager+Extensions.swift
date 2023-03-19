
import Foundation
import UIKit

// MARK: - Validation alert singletone

extension AlertManager {
    
    public static func showIEmptyStringAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Empty data", message: "Please fill all required fields")
    }
    
    public static func showInvalidPaswordOrUsernameAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Invalid Password or Username", message: "Please enter valid password and username")
    }
    
    public static func showExistingUserAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "User with such credentials already exists", message: nil)
    }
    
    public static func showInvalidEmailAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Invalid Email", message: "Please enter a valid email")
    }
    
    public static func showInvalidPasswordAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Invalid Password", message: "Please enter a valid password")
    }
    
    public static func showInvalidUsernameAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Invalid Username", message: "Please enter a valid username")
    }
    
    public static func showRegistrationErrorAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on viewController: UIViewController, with error: Error) {
        self.showAlert(on: viewController, title: "Registration Error", message:"\(error.localizedDescription)")
    }
    
    public static func showSignInErrorAlert(on viewController: UIViewController) {
        self.showAlert(on: viewController, title: "Error Signing in", message: nil)
    }
    
    public static func showSignInErrorAlert(on viewController: UIViewController, with error: Error) {
        self.showAlert(on: viewController, title: "Registration Error", message:"\(error.localizedDescription)")
    }
}
