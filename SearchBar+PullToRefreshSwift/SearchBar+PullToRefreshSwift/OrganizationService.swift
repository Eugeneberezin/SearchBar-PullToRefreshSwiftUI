//
//  OrganizationService.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/9/21.
//

import Foundation
import Combine

class OrganizationService {
    static let shared = OrganizationService()
    private var cancelable = Set<AnyCancellable>()
    
    func fetchOrganizations() -> AnyPublisher<Org, Error> {
    let url = URL(string: "https://opencollective.com/webpack/members/organizations.json")!
                
        return Future { promise in
            let decoder = JSONDecoder()
            URLSession.shared.dataTaskPublisher(for: url)
                .retry(1)
                .mapError {$0}
                .tryMap({ (data, response) in
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return data
                })
                .decode(type: Org.self, decoder: decoder)
                .sink { _ in
                    
                } receiveValue: { organizations in
                    promise(.success(organizations))
                }
                .store(in: &self.cancelable)
        }
        .eraseToAnyPublisher()
    }
    
}

