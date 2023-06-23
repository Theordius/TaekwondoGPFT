//
//  YouTubeService.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 22/06/2023.
//

import SwiftUI
import WebKit

struct YouTubePlayer: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.scrollView.isScrollEnabled = false
        return webView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)?playsinline=1") else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
