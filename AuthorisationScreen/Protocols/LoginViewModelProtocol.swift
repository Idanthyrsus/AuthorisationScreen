import Foundation

protocol LoginViewModelProtocol {
    func submitLogin()
    func isCorrectLogin() -> Bool
    func fetchUser()
}
