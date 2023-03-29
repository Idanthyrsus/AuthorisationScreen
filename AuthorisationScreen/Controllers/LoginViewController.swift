//
//  LoginViewController.swift
//  EffectiveMobileTest
//
//  Created by Alexander Korchak on 10.03.2023.
//

import Foundation
import UIKit
import SnapKit
import Combine

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    var cancellables = Set<AnyCancellable>()
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        loginView.frame = self.view.bounds
        self.hideKeyboardWhenTappedAround()
        setupPublishers()
        loginView.loginButton.addTarget(self, action:  #selector(onSubmit), for: .touchUpInside)
    }
    
    func showViewController() {
        let tabBar = TabBarViewController()
        let navigationController = UINavigationController(rootViewController: tabBar)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    func setupPublishers() {
        // update published variables once text changed for both text fields
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: loginView.firstNameTextField)
            .map {( $0.object as! UITextField).text ?? ""}
            .assign(to: \.firstName, on: viewModel)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: loginView.passwordTextField)
            .map { ($0.object as! UITextField).text ?? ""}
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.isSubmitEnabled
            .assign(to: \.isEnabled, on: loginView.loginButton)
            .store(in: &cancellables)
        
        viewModel.$state
            .sink { [weak self] state in
                switch state {
                case .loading:
                    self?.loginView.loginButton.isEnabled = false
                    self?.loginView.loginButton.setTitle("Loading...", for: .normal)
                case .success:
                    self?.showViewController()
                    self?.resetButton()
                case .failed:
                    self?.resetButton()
                    AlertManager.showInvalidPaswordOrUsernameAlert(on: self ?? LoginViewController())
                case .none:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
    @objc func onSubmit() {
        viewModel.submitLogin()
    }
    
    func resetButton() {
        loginView.loginButton.setTitle("Login", for: .normal)
        loginView.loginButton.isEnabled = true
    }
}
