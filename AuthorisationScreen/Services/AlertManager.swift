
import Foundation
import UIKit

// MARK: - Reusable alert singletone

class AlertManager {
    static func showAlert(on viewController: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Dismiss", style: .default)
            alert.addAction(alertAction)
            viewController.present(alert, animated: true)
        }
    }
}

