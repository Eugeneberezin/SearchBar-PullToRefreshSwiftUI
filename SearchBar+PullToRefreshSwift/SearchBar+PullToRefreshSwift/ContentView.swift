//
//  ContentView.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/9/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var listOfOrgs: [Organization] {
        viewModel.organizations.filter { $0.name.contains(viewModel.searchTerm) || viewModel.searchTerm.isEmpty }
    }
    
    var body: some View {
        NavigationView {
            List(listOfOrgs) { org in
                Text(org.name)
            }
            .refreshable {
                viewModel.organizations = []
                viewModel.fetchOrganizations()
            }
            .navigationTitle("Organizations")
            .onAppear {
                viewModel.fetchOrganizations()
            }
        }

        
        .searchable(text: $viewModel.searchTerm) {
            ForEach(viewModel.searchSuggestions) {suggestion in
                Text(suggestion.name).searchCompletion(suggestion.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
