//
//  MainHeaderView+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 19.03.2023.
//

import Foundation
import UIKit

extension MainHeaderView: MainHeaderViewProtocol {
    func apply(leftLabel text: String) {
        self.leftLabel.text = text
    }
    func apply(rightLabel text: String) {
        self.rightLabel.text = text
    }
}


