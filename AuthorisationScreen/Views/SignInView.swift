//
//  SignInView.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 10.03.2023.

import Foundation
import UIKit
import SnapKit
import CoreData

final class SignInView: UIView, UITextFieldDelegate {
  
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Sign in"
        var descriptor = UIFontDescriptor(name: "Montserrat", size: 30)
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : UIFont.Weight.semibold]])
        label.font = UIFont(descriptor: descriptor, size: 30)
        return label
    }()
    
    lazy var firstNameTextfield: CustomTextfield = {
        let textfield = CustomTextfield(fieldType: .firstName)
        return textfield
    }()
    
    lazy var lastNameTextfield: CustomTextfield = {
        let textfield = CustomTextfield(fieldType: .lastName)
        return textfield
    }()
    
    lazy var emailTextfield: CustomTextfield = {
        let textfield = CustomTextfield(fieldType: .email)
        return textfield
    }()
    
    lazy var signInButton: CustomButton = {
        let button = CustomButton(buttonTitle: .signIn)
        button.isEnabled = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [self.firstNameTextfield,
         self.lastNameTextfield,
         self.emailTextfield].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var haveAnAccountTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Already have an account?  Log in")
        attributedString.addAttribute(.link, value: "login", range: (attributedString.string as NSString).range(of: "Log in"))
        let textView = UITextView()
        textView.linkTextAttributes = [.foregroundColor : UIColor.systemBlue]
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.textColor = .systemGray
        textView.isSelectable = true
        textView.isEditable = false
        textView.delaysContentTouches = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var googleSignInText: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Sign in with Google")
        attributedString.addAttribute(.link, value: "terms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Sign in with Google"))
        let label = SignInView.customSignInTextView()
        label.attributedText = attributedString
        return label
    }()
    
    lazy var appleSignInText: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Sign in with Apple")
        attributedString.addAttribute(.link, value: "appleTerms://termsAndConditions", range: (attributedString.string as NSString).range(of: "Sign in with Apple"))
        let label = SignInView.customSignInTextView()
        label.attributedText = attributedString
        return label
    }()
    
    private lazy var googleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Google-icon-vector-10")
        return imageView
    }()
    
    private lazy var appleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "apple-logo")
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha: 1)
    }
    
    // MARK: - Add subviews
    
    func setupElements() {
        addSubviews([
            signInLabel,
            stackView,
            signInButton,
            haveAnAccountTextView,
            googleSignInText,
            appleSignInText,
            googleImage,
            appleImage
        ])
        
        // MARK: - Set constraints
        
        signInLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-250)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.leading.trailing.equalTo(signInLabel)
            make.top.equalTo(signInLabel.snp.bottom).offset(30)
            make.height.equalTo(180)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
        }
        
        haveAnAccountTextView.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(26)
        }
        
        googleSignInText.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(107)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        
        appleSignInText.snp.makeConstraints { make in
            make.top.equalTo(googleSignInText.snp.bottom).offset(44)
            make.leading.equalTo(self.snp.leading).offset(138)
            make.width.equalTo(107)
            make.height.equalTo(22)
        }
        
        googleImage.snp.makeConstraints { make in
            make.trailing.equalTo(googleSignInText.snp.leading).offset(-9)
            make.width.equalTo(23)
            make.height.equalTo(24)
            make.centerY.equalTo(googleSignInText)
        }
        
        appleImage.snp.makeConstraints { make in
            make.width.equalTo(26.38)
            make.height.equalTo(21.87)
            make.centerY.equalTo(appleSignInText)
            make.trailing.equalTo(appleSignInText.snp.leading).offset(-8)
        }
    }

    private static func customSignInTextView() -> UITextView {
        let label = UITextView()
        label.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        label.backgroundColor = .clear
        label.isSelectable = true
        label.isEditable = false
        label.textAlignment = .left
        label.isScrollEnabled = false
        return label
    }
}

