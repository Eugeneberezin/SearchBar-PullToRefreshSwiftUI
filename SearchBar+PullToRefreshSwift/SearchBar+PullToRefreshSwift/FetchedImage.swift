//
//  FetchedImage.swift
//  SearchBar+PullToRefreshSwift
//
//  Created by Eugene Berezin on 6/13/21.
//
import SwiftUI

struct FetchedImage<Content> : View where Content : View {

    let url: URL?
    @ViewBuilder let content: (AsyncImagePhase) -> Content

    @State private var currentUrl: URL?
    
    var body: some View {
        AsyncImage(url: currentUrl, content: content)
        .task {
            async let loadedURL = url
            await currentUrl = loadedURL
        }
    }
}
