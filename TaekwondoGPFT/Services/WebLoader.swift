//
//  WebLoader.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 07/07/2023.
//

import SwiftUI
import WebKit

struct WebLoader: UIViewRepresentable {
    let url: URL
    @Binding var showLoader: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(showLoader: $showLoader)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var showLoader: Bool

        init(showLoader: Binding<Bool>) {
            _showLoader = showLoader
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            showLoader = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("The page failed to load \(error)")
        }
    }
}
