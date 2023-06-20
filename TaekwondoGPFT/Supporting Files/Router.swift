//
//  Router.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 17/05/2023.
//

import SwiftUI

enum Route: Hashable, Codable, View {
    case patterns
    case theory
    case shop
    case calendar
    case patternDetail(Patterns)
    case theoryDetail(Theory)

    var body: some View {
        switch self {
        case .patterns:
            PatternsView()
        case .theory:
            TheoryView()
        case .shop:
            WebView()
        case .calendar:
            CalendarView()
        case let .patternDetail(pattern):
            PatternDetailView(pattern: pattern)
        case let .theoryDetail(theory):
            TheoryDetailView(theory: theory)
        }
    }
}

class Router: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")

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
