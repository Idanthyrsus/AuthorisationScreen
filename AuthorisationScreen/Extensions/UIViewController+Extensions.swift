//
//  UIViewController+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 15.03.2023.
//

import Foundation
import UIKit

protocol KeyboardProtocol {
    func hideKeyboardWhenTappedAround()
}

extension UIViewController: KeyboardProtocol {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
