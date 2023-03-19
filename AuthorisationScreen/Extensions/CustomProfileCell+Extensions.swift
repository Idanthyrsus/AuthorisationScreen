
import Foundation
import UIKit

extension CustomProfileCell {
    
    func apply(image: String) {
        smallIconImageView.image = UIImage(systemName: image)
    }

    func apply(text: String) {
        categoryLabel.text = text
    }

    func apply(rightElement: String) {
        let config = UIImage.SymbolConfiguration(pointSize: 12, weight: .heavy)
        self.rightElementImageView.image = UIImage(systemName: rightElement, withConfiguration: config)
    }
}

