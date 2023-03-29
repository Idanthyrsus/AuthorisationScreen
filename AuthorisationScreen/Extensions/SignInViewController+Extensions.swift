//
//  SignInController+Extensions.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 11.03.2023.
//

import Foundation
import UIKit

extension SignInViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.debugDescription == "login" {
            self.goToViewController()
        } else if URL.scheme == "terms" {
            DispatchQueue.main.async {
                self.showWebViewController(with: "https://policies.google.com/terms?hl=en")
            }
        } else if URL.scheme == "appleTerms" {
            self.showWebViewController(with: "https://appleid.apple.com/sign-in")
        }
        return true
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
    
    private func goToViewController() {
        let viewController = LoginViewController()
        self.present(viewController, animated: true)
    }
    
    private func showWebViewController(with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true)
    }
}
