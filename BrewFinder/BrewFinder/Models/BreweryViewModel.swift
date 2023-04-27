//
//  BreweryViewModel.swift
//  BrewFinder
//
//  Created by Taylor Heyen on 4/24/23.
//
import Foundation
import Combine

class BreweryViewModel: ObservableObject {
    @Published var breweries = [BreweryResults]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func fetchData(city: String, state: String, page: Int, completion: (() -> Void)? = nil) {
        let urlString = "https://api.openbrewerydb.org/breweries?by_city=\(city)&by_state=\(state)&per_page=50&page=\(page)"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [BreweryResults].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { breweries in
                    self.objectWillChange.send()
                    self.breweries = breweries
                    print("Breweries for page \(page): \(breweries)")
                    completion?()
                })
                .store(in: &cancellableSet)
        }
    }

}
