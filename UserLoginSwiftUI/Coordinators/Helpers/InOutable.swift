
import Foundation

protocol InOutableProtocol: AnyObject {
    associatedtype InputType
    associatedtype OutputType

    func perform(with input: InputType)
    var output: ((OutputType) -> Void)? { get set }
}

extension InOutableProtocol {
    func perform(with input: InputType) {}
}
