//
//  CalendarView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 07/11/2022.
//

import UIKit
import WebKit

class CalendarView: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func observeValue(
        forKeyPath keyPath: String?, of object: Any?,
        change: [NSKeyValueChangeKey: Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()

        let progressButton = UIBarButtonItem(customView: progressView)

        toolbarItems = [progressButton, spacer]
        navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)

        webView.load("https://www.facebook.com/taekwondopft/")
        webView.allowsBackForwardNavigationGestures = true
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.isLoading == false {
            title = webView.title
            navigationController?.isToolbarHidden = true

        } else {
            return
        }
    }
}
