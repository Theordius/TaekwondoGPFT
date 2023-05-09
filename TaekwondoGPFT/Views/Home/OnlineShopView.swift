//
//  OnlieShopView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/11/2022.
//

import Combine
import Foundation
import SwiftUI
import UIKit
import WebKit

// MARK: - WebViewHandlerDelegate

// For printing values received from web app
protocol WebViewHandlerDelegate {
    func receivedJsonValueFromWebView(value: [String: Any?])
    func receivedStringValueFromWebView(value: String)
}

// MARK: - WebView

struct OnlineShopView: UIViewRepresentable, WebViewHandlerDelegate {
    func receivedJsonValueFromWebView(value: [String: Any?]) {
        print("JSON value received from web is: \(value)")
    }

    func receivedStringValueFromWebView(value: String) {
        print("String value received from web is: \(value)")
    }

    var url: WebUrlType
    // Viewmodel object
    @ObservedObject var viewModel: ViewModel

    // Make a coordinator to co-ordinate with WKWebView's default delegate functions
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        // Enable javascript in WKWebView
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true

        let configuration = WKWebViewConfiguration()
        // Here "iOSNative" is our delegate name that we pushed to the website that is being loaded
        configuration.userContentController.add(makeCoordinator(), name: "iOSNative")

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }

    func updateUIView(_ webView: WKWebView, context _: Context) {
        if url == .publicUrl {
            // Load local website
            if let url = URL(string: "https://sklep.gpft.pl") {
                webView.load(URLRequest(url: url))
            }
        }
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: OnlineShopView
        var delegate: WebViewHandlerDelegate?
        var valueSubscriber: AnyCancellable? = nil
        var webViewNavigationSubscriber: AnyCancellable? = nil

        init(_ uiWebView: OnlineShopView) {
            parent = uiWebView
            delegate = parent
        }

        deinit {
            valueSubscriber?.cancel()
            webViewNavigationSubscriber?.cancel()
        }

        func webView(_ webView: WKWebView, didFinish _: WKNavigation!) {
            // Get the title of loaded webcontent
            webView.evaluateJavaScript("document.title") { response, error in
                if let error = error {
                    print("Error getting title")
                    print(error.localizedDescription)
                }

                guard let title = response as? String else {
                    return
                }

                self.parent.viewModel.showWebTitle.send(title)
            }

            /* An observer that observes 'viewModel.valuePublisher' to get value from TextField and
             pass that value to web app by calling JavaScript function */
            valueSubscriber = parent.viewModel.valuePublisher.receive(on: RunLoop.main).sink(receiveValue: { value in
                let javascriptFunction = "valueGotFromIOS(\(value));"
                webView.evaluateJavaScript(javascriptFunction) { _, error in
                    if let error = error {
                        print("Error calling javascript:valueGotFromIOS()")
                        print(error.localizedDescription)
                    } else {
                        print("Called javascript:valueGotFromIOS()")
                    }
                }
            })

            // Page loaded so no need to show loader anymore
            parent.viewModel.showLoader.send(false)
        }

        /* Here I implemented most of the WKWebView's delegate functions so that you can know them and
         can use them in different necessary purposes */

        func webViewWebContentProcessDidTerminate(_: WKWebView) {
            // Hides loader
            parent.viewModel.showLoader.send(false)
        }

        func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
            // Hides loader
            parent.viewModel.showLoader.send(false)
        }

        func webView(_: WKWebView, didCommit _: WKNavigation!) {
            // Shows loader
            parent.viewModel.showLoader.send(true)
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            // Shows loader
            parent.viewModel.showLoader.send(true)
            webViewNavigationSubscriber = parent.viewModel.webViewNavigationPublisher.receive(on: RunLoop.main).sink(receiveValue: { navigation in
                switch navigation {
                case .backward:
                    if webView.canGoBack {
                        webView.goBack()
                    }
                case .forward:
                    if webView.canGoForward {
                        webView.goForward()
                    }
                case .reload:
                    webView.reload()
                }
            })
        }

        // This function is essential for intercepting every navigation in the webview
        func webView(_: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // Suppose you don't want your user to go a restricted site
            // Here you can get many information about new url from 'navigationAction.request.description'
            if let host = navigationAction.request.url?.host {
                if host == "restricted.com" {
                    // This cancels the navigation
                    decisionHandler(.cancel)
                    return
                }
            }
            // This allows the navigation
            decisionHandler(.allow)
        }
    }
}

// MARK: - Extensions

extension OnlineShopView.Coordinator: WKScriptMessageHandler {
    func userContentController(_: WKUserContentController, didReceive message: WKScriptMessage) {
        // Make sure that your passed delegate is called
        if message.name == "iOSNative" {
            if let body = message.body as? [String: Any?] {
                delegate?.receivedJsonValueFromWebView(value: body)
            } else if let body = message.body as? String {
                delegate?.receivedStringValueFromWebView(value: body)
            }
        }
    }
}
