//
//  Router.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 17/05/2023.
//

import SwiftUI

enum Route: Hashable {
    case patterns(Patterns)
    case theory(Theory)
    case shop(OnlineShop)
}

class Router: ObservableObject {
    @Published var path = NavigationPath()

    func resetPath() {
        path = NavigationPath()
    }
}
