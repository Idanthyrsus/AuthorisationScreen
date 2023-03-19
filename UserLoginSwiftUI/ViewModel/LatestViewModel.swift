
import Foundation
import Combine

final class LatestViewModel: ObservableObject {

    @Published var latestItems: [LatestElement] = []

    var cancellables = Set<AnyCancellable>()

    init() {
        getLatest()
    }

    private func getLatest() {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: LatestResponse.self, decoder: JSONDecoder())
            .map({ $0.latest })
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedItems in
                self?.latestItems = returnedItems
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
