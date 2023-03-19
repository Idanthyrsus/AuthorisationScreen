import Foundation
import Combine
import CoreData
import UIKit

class LoginViewModel: LoginViewModelProtocol {
    enum LoginState {
        case loading
        case success
        case failed
        case none
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userDetails: [AccountDetails] = []
 
    @Published var firstName = ""
    @Published var password = ""
    @Published var state: LoginState = .none
       
       var isValidEmailPublisher: AnyPublisher<Bool, Never> {
           $firstName
               .map { !$0.isEmpty }
               .eraseToAnyPublisher()
       }
       
       var isValidPasswordPublisher: AnyPublisher<Bool, Never> {
           $password
               .map{ !$0.isEmpty }
               .eraseToAnyPublisher()
       }
    
    var isSubmitEnabled: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isValidEmailPublisher, isValidPasswordPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    func submitLogin() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else {
                return
            }
            if self.isCorrectLogin() {
                self.state = .success
            } else {
                self.state = .failed
            }
        }
    }
    
    func isCorrectLogin() -> Bool {
        fetchUser()
        return (userDetails.contains(where: { $0.firstName == firstName })) && (password.validatePassword())
    }
    
    func fetchUser() {
        do {
            self.userDetails = try context.fetch(AccountDetails.fetchRequest())
        } catch let error as NSError {
            print("Error occured \(error)")
        }
    }
}
