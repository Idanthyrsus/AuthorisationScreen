//
//  LatestCollectionViewCell+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation

extension LatestCollectionViewCell {
    
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
    
    func apply(priceLabel text: Int) {
        self.priceLabel.text = "$ \(text)"
    }
}
