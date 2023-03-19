
import Foundation
import UIKit
import SwiftUI

typealias SignInViewResult = ModuleFactoryResult<SignInViewModelInput, SignInViewModelOutput>
typealias LoginViewResult = ModuleFactoryResult<LoginViewInput, LoginViewOutput>

final class AuthCoordinatorFactory {
    static func makeSigInView() -> SignInViewResult {
        let viewModel = SignInViewModel()
        let sigInView = SignInView(viewModel: viewModel)
        let presentable = UIHostingController(rootView: sigInView)
        return (module: AnyInOutable(viewModel), view: presentable)
    }

    static func makeLoginView() -> LoginViewResult {
        let viewModel = LoginViewModel()
        let loginView = LoginView(viewModel: viewModel)
        let presentable = UIHostingController(rootView: loginView)
        return (module: AnyInOutable(viewModel), view: presentable)
    }
}
