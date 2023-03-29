//
//  ViewController.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 10.03.2023.
//

import UIKit
import CoreData
import Combine

final class SignInViewController: UIViewController, UITextFieldDelegate {
    let signInView = SignInView()
    let viewModel = SignInViewModel()
    var cancellables = Set<AnyCancellable>()

    var userService = UserService()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userDetails: [AccountDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInView.frame = self.view.bounds
        self.view.addSubview(signInView)
        signInView.firstNameTextfield.delegate = self
        signInView.lastNameTextfield.delegate = self
        signInView.emailTextfield.delegate = self
        signInView.haveAnAccountTextView.delegate = self
        self.hideKeyboardWhenTappedAround()
        signInView.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        signInView.googleSignInText.delegate = self
        signInView.appleSignInText.delegate = self
        signInView.firstNameTextfield.addTarget(self, action: #selector(firstNameValueChanged), for: .editingChanged)
        signInView.lastNameTextfield.addTarget(self, action: #selector(lastNameValueChanged), for: .editingChanged)
        signInView.emailTextfield.addTarget(self, action: #selector(emailValueChanged), for: .editingChanged)
        viewModel.signInButtonPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  newValue in
                self?.signInView.signInButton.isEnabled = newValue
            }
            .store(in: &cancellables)
    }
    
    func updateButtonState(isEnabled: Bool) {
        signInView.signInButton.isEnabled = isEnabled
    }
    
    @objc func firstNameValueChanged() {
        viewModel.updateFirst(name: signInView.firstNameTextfield.text ?? "")
    }
    
    @objc func lastNameValueChanged() {
        viewModel.updateLast(name: signInView.lastNameTextfield.text ?? "")
    }
    
    @objc func emailValueChanged() {
        viewModel.update(email: signInView.emailTextfield.text ?? "")
    }
    

    @objc func didTapSignIn() {

        if let email = signInView.emailTextfield.text {
              guard email.validateEmail() else {
                  AlertManager.showInvalidEmailAlert(on: self)
                  return
              }
          }

        fetchUser()
        if viewModel.userHasAnAccount(with: userDetails) {
            AlertManager.showExistingUserAlert(on: self)
        } else {
            let newUser = userService.storeUserDetails(firstName: signInView.firstNameTextfield.text,
                                                       lastName: signInView.lastNameTextfield.text,
                                                       email: signInView.emailTextfield.text)
            userDetails.append(newUser)
            showViewController()
        }
    }
    


    func fetchUser() {
        self.userDetails = userService.fetchUsers()
    }

    func showViewController() {
        let viewController = TabBarViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

