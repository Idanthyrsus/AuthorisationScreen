

import SwiftUI
import Combine

enum SignInViewModelInput {
    case `default`
}

enum SignInViewModelOutput {
    case loginPressed
    case signInCompleted
}

final class SignInViewModel: InOutableProtocol, ObservableObject {
    typealias InputType = SignInViewModelInput
    typealias OutputType = SignInViewModelOutput

    var output: ((SignInViewModelOutput) -> Void)?

    @Published var email = ""

    func perform(with input: SignInViewModelInput) {
    }

    func loginPressed() {
        output?(.loginPressed)
    }

    func signIn() {
        //кладем в базу пользователя, валидируем если нужно поля
        output?(.signInCompleted)
    }
}

