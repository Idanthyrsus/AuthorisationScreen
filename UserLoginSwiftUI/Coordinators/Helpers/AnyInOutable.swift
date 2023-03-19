
import Foundation
import SwiftUI

protocol Presentable {
    var toPresent: UIViewController { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController {
        self
    }
}

typealias ModuleFactoryResult<Input, Output> = (
    module: AnyInOutable<Input, Output>,
    view: Presentable
)

final class AnyInOutable<InputType, OutputType>: InOutableProtocol {
    private let setOutputClosure: (((OutputType) -> Void)?) -> Void
    private let getOutputClosure: () -> ((OutputType) -> Void)?
    private let performClosure: (InputType) -> Void

    init<T: InOutableProtocol>(_ module: T) where T.InputType == InputType, T.OutputType == OutputType {
        performClosure = { input in
            module.perform(with: input)
        }

        getOutputClosure = { () -> ((OutputType) -> Void)? in
            module.output
        }

        setOutputClosure = { output in
            module.output = output
        }
    }

    func perform(with input: InputType) {
        performClosure(input)
    }

    var output: ((OutputType) -> Void)? {
        get {
            getOutputClosure()
        }

        set {
            setOutputClosure(newValue)
        }
    }
}
