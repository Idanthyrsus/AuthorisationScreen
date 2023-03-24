import Foundation
import UIKit

// A class with custom textfield implementation

final class CustomTextfield: UITextField {
    
    let customBackgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    enum Placeholders {
        case firstName
        case lastName
        case email
        case password
        case search
        
        var description: String {
            switch self {
            case .firstName:
                return "First name"
            case .lastName:
                return "Last name"
            case .email:
                return "Email"
            case .password:
                return "Password"
            case .search:
                return "What are you looking for?"
            }
        }
    }
    
    private let authorisationFieldType: Placeholders
    
    init(fieldType: Placeholders) {
        self.authorisationFieldType = fieldType
        super.init(frame: .zero)
        self.textAlignment = .center
        self.backgroundColor = customBackgroundColor
        self.layer.cornerRadius = 16
        self.textColor = .systemGray
        self.returnKeyType = .done
        self.autocapitalizationType = .words
        self.autocorrectionType = .no
        self.textColor = .black
        var descriptor = UIFontDescriptor(name: "Montserrat", size: 14)
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : UIFont.Weight.semibold]])
        self.font = UIFont(descriptor: descriptor, size: 14)
        
        // Switch between authorization types to get the appropriate placeholder
        
        switch fieldType {
        case .firstName:
            self.placeholder = Placeholders.firstName.description
        case .lastName:
            self.placeholder = Placeholders.lastName.description
        case .email:
            self.placeholder = Placeholders.email.description
            self.keyboardType = .emailAddress
            self.autocapitalizationType = .none
        case .password:
            self.placeholder = Placeholders.password.description
        case .search:
            self.placeholder = Placeholders.search.description
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
