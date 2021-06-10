//
//  ViewModel.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/9/21.
//

import Foundation
import Combine

class ViewModel:ObservableObject {
    @Published var organizations = [Organization]()
    @Published var searchTerm = ""
    private var cancelables = Set<AnyCancellable>()
    
    var searchSuggestions: [Organization] {
        organizations.filter {$0.name.contains(searchTerm)}
    }
    
    func fetchOrganizations() {
        OrganizationService.shared.fetchOrganizations()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: {[weak self] orgs in
                guard let self = self else { return }
                self.organizations = orgs
            }
            .store(in: &cancelables)
    }
    
    
    
}
