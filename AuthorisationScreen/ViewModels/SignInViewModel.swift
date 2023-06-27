import Foundation
import Combine
import UIKit

final class SignInViewModel: SignInViewModelProtocol {
    
    private var firstName: String = ""
    private var lastName: String = ""
    private var email: String = ""
    
    let signInView = SignInView()
    let signInButtonPublisher = PassthroughSubject<Bool, Never>()
    let checkUserPublisher = PassthroughSubject<Bool, Error>()
    
    func updateFirst(name: String) {
        firstName = name
        checkData()
    }
    
    func updateLast(name: String) {
        lastName = name
        checkData()
    }
    
    func update(email: String) {
        self.email = email
        checkData()
    }
    
    private func checkData() {
        signInButtonPublisher.send(firstName.count != 0 && lastName.count != 0 && email.count != 0)
    }
}
