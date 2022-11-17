//
//  WebLoader.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 16/11/2022.
//

import Foundation
import WebKit

final class URLLoader: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    let url = URL(string: "")
    
    enum urlError: Error, Equatable {
        case pageFailedToLoad(_ message: String = "")
    }
    
    func loadURL() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
}
