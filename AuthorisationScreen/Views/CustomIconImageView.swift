//
//  CustomIconImageView.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import Foundation
import UIKit

final class CustomIconImageView: UIImageView {
    
    enum IconChoices {
        case pay
        case restore
        case help
        case logout
        
        var description: String {
            switch self {
            case .pay:
                return "creditcard"
            case .restore:
                return "repeat.circle"
            case .help:
                return "questionmark.circle"
            case .logout:
                return "rectangle.portrait.and.arrow.right"
                
            }
        }
    }

    private let iconChoices: IconChoices
    
    init(iconChoices: IconChoices) {
        self.iconChoices = iconChoices
        super.init(frame: .zero)
        self.layer.cornerRadius = 20
        
        switch iconChoices {
        case .pay:
            self.image = UIImage(systemName: IconChoices.pay.description)
        case .restore:
            self.image = UIImage(systemName: IconChoices.restore.description)
        case .help:
            self.image = UIImage(systemName: IconChoices.help.description)
        case .logout:
            self.image = UIImage(systemName: IconChoices.logout.description)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
