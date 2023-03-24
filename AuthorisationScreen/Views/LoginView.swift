
import Foundation
import UIKit
import SnapKit

final class LoginView: UIView, UITextFieldDelegate {
    
    enum EyeIcon {
        case open, closed
        
        var description: String {
            switch self {
            case .open:
                return "eye"
            case .closed:
                return "eye.slash"
            }
        }
    }
    
    let customBackgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
    
    let customColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
    
    lazy var welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    lazy var firstNameTextField: CustomTextfield = {
        let text = CustomTextfield(fieldType: .firstName)
        text.delegate = self
        return text
    }()
    
    lazy var passwordTextField: TextFieldWithPadding = {
        let textfield = TextFieldWithPadding()
        let visibilityButton = UIButton()
        var image = UIImage(systemName: EyeIcon.closed.description)
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        var symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 10)
        configuration.preferredSymbolConfigurationForImage = symbolConfiguration
        visibilityButton.configuration = configuration
        visibilityButton.setImage(image, for: .normal)
        visibilityButton.tintColor = .gray
        visibilityButton.addTarget(self, action: #selector(changePasswordVisibility), for: .touchUpInside)
        textfield.rightViewMode = .always
        textfield.rightView = visibilityButton
        var descriptor = UIFontDescriptor(name: "Montserrat", size: 14)
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : UIFont.Weight.semibold]])
        textfield.font = UIFont(descriptor: descriptor, size: 14)
        textfield.returnKeyType = .done
        textfield.autocapitalizationType = .words
        textfield.autocorrectionType = .no
        textfield.textColor = .black
        textfield.placeholder = "Password"
        textfield.backgroundColor = customBackgroundColor
        textfield.layer.cornerRadius = 16
        textfield.isSecureTextEntry = true
        textfield.delegate = self
        return textfield
    }()
    
    lazy var loginButton: CustomButton = {
        let button = CustomButton(buttonTitle: .login)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.firstNameTextField,
         self.passwordTextField].forEach { stack.addArrangedSubview($0)}
        return stack
    }()
    
    // MARK: - Selectors
    
    @objc func changePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        if passwordTextField.isSecureTextEntry {
            if let image = UIImage(systemName: EyeIcon.closed.description) {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: EyeIcon.open.description) {
                sender.setImage(image, for: .normal)
            }
        }
    }
    
    // MARK: - Add subviews
    
    private func setupElements() {
        addSubviews([
            welcomeBackLabel,
            stackView,
            loginButton
        ])
        
        stackView.snp.makeConstraints { make in
            make.centerX.left.right.equalTo(welcomeBackLabel)
            make.top.equalTo(welcomeBackLabel.snp.bottom).offset(60)
            make.height.equalTo(100)
        }
        
        welcomeBackLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(60)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = customColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


