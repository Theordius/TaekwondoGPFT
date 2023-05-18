//
//  Router.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 17/05/2023.
//

import SwiftUI

enum Route: Hashable, Codable {
    case patterns
    case theory
    case shop
    case calendar
}

enum ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Route) -> some View {
        switch destination {
        case .patterns:
            PatternsView()
        case .theory:
            TheoryView()
        case .shop:
            WebView()
        case .calendar:
            CalendarView()
        }
    }
}

class Router: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }

    func resetPath() {
        path = NavigationPath()
    }
}
