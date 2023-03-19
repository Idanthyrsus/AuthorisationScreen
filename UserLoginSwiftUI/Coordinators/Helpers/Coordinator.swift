
import Foundation

/// Интерфейс координатора
protocol Coordinator: AnyObject {
    associatedtype StartOption
    associatedtype OutputOption

    /// Начинает флоу модуля полагаясь на переданную опцию
    /// - Parameter option: опция запуска модуля
    func start(with option: StartOption)
    var output: ((OutputOption) -> Void)? { get set }
}

extension Coordinator where StartOption == Void {
    func start() {
        start(with: ())
    }
}
