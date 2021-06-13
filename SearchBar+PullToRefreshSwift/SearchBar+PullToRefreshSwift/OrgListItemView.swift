//
//  OrgListItemView.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/13/21.
//

import SwiftUI

struct OrgListItemView: View {
    let org: Organization
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: org.image ?? "") {
                AsyncImage(url: url, transaction: .init(animation: .spring())) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 400, alignment: .center)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    case .failure(_):
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(.gray)
                            Text("**Image is not available**")
                        }
                        .frame(width: 200, height: 400)
                        
                    @unknown default:
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(.gray)
                            Text("** Image is not available **")
                        }
                    }
                }
                .padding()
                .frame(minWidth: 0, maxWidth: 500)
                .cornerRadius(6)
            } else {
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(minWidth: 0, maxWidth: 500)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("**\(org.name)**")
                Text("`Type: \(org.type.rawValue)`")
                Text("Role: \(org.role.rawValue)")
                Text("Description: \(org.modelDescription ?? "N/A")")
                if let websiteLink = URL(string: org.website ?? "") {
                    Link("Website", destination: websiteLink)
                }
                if let twitterLink = URL(string: org.twitter ?? "") {
                    Link("Twitter", destination: twitterLink)
                }
                if let gitHubLink = URL(string: org.github ?? "") {
                    Link("GitHub", destination: gitHubLink)
                }
                
            }
            .padding()
        }
        .background(Color.gray)
        .cornerRadius(6)
        .listRowSeparator(.hidden)
    }
}
