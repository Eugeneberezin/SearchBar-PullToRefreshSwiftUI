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
            List {
                ForEach(listOfOrgs) { org in
                    SmallRawViee(org: org)

                }
            }
            .refreshable {
                viewModel.organizations = []
                viewModel.fetchOrganizations()
            }
            .navigationTitle("Organizations")
        }
        .searchable(text: $viewModel.searchTerm, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for the company")
        .task {
            viewModel.fetchOrganizations()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
