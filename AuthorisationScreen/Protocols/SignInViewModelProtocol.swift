import Foundation

protocol SignInViewModelProtocol {
    func updateFirst(name: String)
    func updateLast(name: String)
    func update(email: String)
}
