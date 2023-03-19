
import Foundation
import UIKit
import Combine


enum NetworkError: Error {
    case emptyLatest
    case emptyFlash
}

protocol NetworkService {
    func getLatest() -> AnyPublisher<LatestResponse, Error>
    func getFlash() -> AnyPublisher<FlashSaleResponse, Error>
}

final class NetworkServiceImpl: NetworkService {
    
    var cancellables = Set<AnyCancellable>()
    let viewModel = MainViewModel()
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    func getLatest()  -> AnyPublisher<LatestResponse, Error> {
       let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LatestResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getFlash() -> AnyPublisher<FlashSaleResponse, Error>  {
        let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: FlashSaleResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


