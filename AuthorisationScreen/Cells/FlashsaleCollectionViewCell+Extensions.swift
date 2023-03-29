//
//  FlashsaleCollectionViewCell+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation
import UIKit

extension FlashsaleCollectionViewCell {
    func apply(backgroundImage: String) {
        if let url = URL(string: backgroundImage) {
            self.backgroundImageView.sd_setImage(with: url)
        }
    }
    
    func apply(categoryLabel text: String) {
        self.categoryLabel.text = text
    }
    
    func apply(brandLabel text: String) {
        self.brandLabel.text = text
    }
    
    func apply(priceLabel text: Double) {
        self.priceLabel.text = "$ \(text)"
    }
    
    func apply(discountLabel text: Int) {
        self.discountLabel.text = "\(text)% off"
    }
}
