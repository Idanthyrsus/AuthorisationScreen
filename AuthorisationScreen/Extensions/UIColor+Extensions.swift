//
//  UIColor+Extensions.swift
//  AuthorisationScreen
//
//  Created by Alexander Korchak on 27.06.2023.
//

import Foundation
import UIKit

extension UIColor {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let background = UIColor(named: "Background")
    let textfieldBackground = UIColor(named: "TextfieldBackground")
    let buttonBackground = UIColor(named: "ButtonBackground")
    let buttonTitle = UIColor(named: "ButtonTitle")
    let searchBarBackground = UIColor(named: "SearchBarBackground")
}
