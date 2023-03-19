//
//  CategoryCollectionViewCell+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation
import UIKit

extension CategoryCollectionViewCell {
    
    func apply(image: String) {
        smallIconImageView.image = UIImage(systemName: image)
    }
    
    func applyLabel(text: String) {
        categoryLabel.text = text
    }
}
