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
    let url = URL(string: "https://sklep.gpft.pl")!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
     
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
