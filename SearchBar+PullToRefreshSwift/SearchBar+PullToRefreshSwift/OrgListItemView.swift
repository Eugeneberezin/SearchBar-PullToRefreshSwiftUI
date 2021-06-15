//
//  OrgListItemView.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/13/21.
//

import SwiftUI

struct OrgListItemView: View {
    let org: Organization
    
    var website: AttributedString {
        var website = AttributedString("Website is not available")
        do {
            website = try AttributedString(markdown: "[Website](\(org.website ?? ""))")
        } catch {
            print("No Link")
        }
        return website
    }
    
    var twitter: AttributedString {
        var twitterLink = AttributedString("Twitter link not found")
        do {
          twitterLink = try AttributedString(markdown:"[Twitter](\(org.twitter ?? ""))")
            
        } catch {
            print("No link")
        }
        return twitterLink
    }
    
    var gitHub: AttributedString {
        var githubLink = AttributedString("No Github")
        do {
            githubLink = try AttributedString(markdown: "[GitGub](\(org.github ?? ""))")
        } catch {
            print("No link")
        }
        return githubLink
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: org.image ?? "") {
                FetchedImage(url: url ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 200, height: 400, alignment: .center)
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(6)
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
                Text("No Image")
                    .foregroundColor(.red)
                    .frame(minWidth: 0, maxWidth: 500)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("**\(org.name)**")
                Text("`Type: \(org.type.rawValue)`")
                Text("Role: \(org.role.rawValue)")
                Text("Description: \(org.modelDescription ?? "N/A")")
                
                if org.website != nil {
                    Text(website)
                }
                if org.twitter != nil {
                    Text(twitter)
                }
                if org.github != nil {
                  Text(gitHub)
                }
                
            }
            .padding()
            .frame(minWidth: 0, maxWidth: 500, alignment: .leading)
            .background(.ultraThinMaterial)
            .cornerRadius(6)
        }
        .background(Color(uiColor: .lightGray))
        .cornerRadius(6)
        .listRowSeparator(.hidden)
    }
}

