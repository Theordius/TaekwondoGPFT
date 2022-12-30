//
//  WebLoader.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 16/11/2022.
//

import Foundation
import WebKit

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
