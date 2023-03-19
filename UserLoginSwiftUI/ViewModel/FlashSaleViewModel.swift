
import Foundation
import Combine

final class FlashSaleViewModel: ObservableObject {

    @Published var flashItems: [FlashSaleElement] = []

    var cancellables = Set<AnyCancellable>()

    init() {
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: FlashSaleResponse.self, decoder: JSONDecoder())
            .map({ $0.flashSale ?? [] })
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedItems in
                self?.flashItems = returnedItems
            })
            .store(in: &cancellables)
    }

    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
