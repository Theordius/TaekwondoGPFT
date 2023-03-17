//
//  OnlineShopViewModel.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/11/2022.
//

import Foundation
import SwiftUI
import Combine


extension OnlineShopView {
    class ViewModel: ObservableObject {
        var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
        var showLoader = PassthroughSubject<Bool, Never>()
        var valuePublisher = PassthroughSubject<String, Never>()
    }
    
    enum WebViewNavigation {
        case backward, forward
    }
    
    enum WebUrl {
        case localUrl, publicUrl
    }
}
