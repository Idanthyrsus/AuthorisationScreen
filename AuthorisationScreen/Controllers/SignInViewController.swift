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
        if userDetails.contains(where: { $0.firstName == signInView.firstNameTextfield.text &&
                                         $0.lastName == signInView.lastNameTextfield.text &&
                                         $0.email == signInView.emailTextfield.text
        }) {
            AlertManager.showExistingUserAlert(on: self)
        } else {
            storeUserDetails()
            showViewController()
        }
    }
    
    func storeUserDetails() {
        let newUser = AccountDetails(context: self.context)
        newUser.firstName = signInView.firstNameTextfield.text
        newUser.lastName = signInView.lastNameTextfield.text
        newUser.email = signInView.emailTextfield.text
        userDetails.append(newUser)
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Error occured \(error)")
        }
    }

    func fetchUser() {
        do {
            self.userDetails = try context.fetch(AccountDetails.fetchRequest())
        } catch let error as NSError {
            print("Error occured \(error)")
        }
    }

    func showViewController() {
        let viewController = TabBarViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

