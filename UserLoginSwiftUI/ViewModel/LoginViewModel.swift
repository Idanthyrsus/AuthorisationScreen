
import Foundation

enum LoginViewInput {
    case `default`
}

enum LoginViewOutput {
    case authorized
}

final class LoginViewModel: InOutableProtocol, ObservableObject {
    typealias InputType = LoginViewInput
    typealias OutputType = LoginViewOutput

    var firstName: String = ""
    var password: String = ""
    var showPassword: Bool = false

    var output: ((LoginViewOutput) -> Void)?
    
    func perform(with input: LoginViewOutput) {
    }

    func loginPressed() {
        output?(.authorized)
    }
}
