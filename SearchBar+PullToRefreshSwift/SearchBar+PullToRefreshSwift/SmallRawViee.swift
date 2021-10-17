//
//  SmallRawViee.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/21/21.
//

import SwiftUI

struct SmallRawViee: View {
    var org: Organization
    var body: some View {
        HStack {
            if let url = URL(string: org.image ?? "") {
                FetchedImage(url: url ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 70, height: 70, alignment: .center)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .center)
                            .cornerRadius(6)
                            .aspectRatio(contentMode: .fill)
                        
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundColor(.gray)
                             .frame(width: 70, height: 70, alignment: .center)
                        
                    @unknown default:
                        Image(systemName: "photo")
                            .resizable()
                            .foregroundColor(.gray)
                             .frame(width: 70, height: 70, alignment: .center)
                    }
                }
                .padding()
                .frame(width: 70, height: 70, alignment: .center)
                .cornerRadius(6)
            
            } else {
                Image(systemName: "photo")
                    .resizable()
                     .frame(width: 70, height: 70, alignment: .center)
                     .foregroundColor(.gray)
            }
            
            Text(org.name)
    }
}
}

