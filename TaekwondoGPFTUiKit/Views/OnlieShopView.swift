//
//  OnlieShopView.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 09/11/2022.
//

import UIKit
import WebKit

class OnlieShopView: UIViewController, WKNavigationDelegate {
    var webView : WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://sklep.gpft.pl")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
    }

}
