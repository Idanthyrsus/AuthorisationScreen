//
//  CustomButton.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
        
    let customBackroundColor = UIColor(red: 78/255, green: 85/255, blue: 215/255, alpha: 1)
    let titleCustomColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    
        enum ButtonTitles {
            case signIn
            case login
            case upload
            
            var description: String {
                switch self {
                case .signIn:
                    return "Sign in"
                case .login:
                    return "Login"
                case .upload:
                    return "Upload item"
                }
            }
        }
        
        private let buttonTitle: ButtonTitles
        
        init(buttonTitle: ButtonTitles) {
            self.buttonTitle = buttonTitle
            super.init(frame: .zero)
            self.setTitleColor( .white, for: .normal)
            self.setTitleColor(.init(white: -5, alpha: 0.8), for: .highlighted)
            self.setTitleColor(.init(white: 0, alpha: 0.8), for: .selected)
            self.setTitleColor(titleCustomColor, for: .disabled)
            var descriptor = UIFontDescriptor(name: "Montserrat", size: 30)
            descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : UIFont.Weight.bold]])
            self.titleLabel?.font = UIFont(descriptor: descriptor, size: 20)
            self.layer.cornerRadius = 18
            self.clipsToBounds = true
            self.backgroundColor = customBackroundColor
            
            // Switch between button types to get the appropriate title
            
            switch buttonTitle {
            case .signIn:
                self.setTitle(ButtonTitles.signIn.description, for: .normal)
            case .login:
                self.setTitle(ButtonTitles.login.description, for: .normal)
            case .upload:
                self.setTitle(ButtonTitles.upload.description, for: .normal)
            }
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
