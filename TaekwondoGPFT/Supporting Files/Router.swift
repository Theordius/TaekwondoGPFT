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
    case patternDetail(Patterns)
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
        case let .patternDetail(pattern):
            PatternDetailView(pattern: pattern)
        }
    }
}

class Router: ObservableObject {
    @Published var path: NavigationPath {
        didSet {
            save()
        }
    }

    static func readSerializedData() -> Data? {
        let savedPath = URL.documentsDirectory.appendingPathComponent("SavedPathStore")
        return try? Data(contentsOf: savedPath)
    }

    static func writeSerializedData(_ data: Data) {
        let savedPath = URL.documentsDirectory.appendingPathComponent("SavedPathStore")
        do {
            try data.write(to: savedPath)
        } catch {
            print("Failed to write navigation data to file: \(error)")
        }
    }

    init() {
        if let data = Self.readSerializedData() {
            do {
                let representation = try JSONDecoder().decode(
                    NavigationPath.CodableRepresentation.self,
                    from: data
                )
                path = NavigationPath(representation)
            } catch {
                path = NavigationPath()
            }
        } else {
            path = NavigationPath()
        }
    }

    func save() {
        guard let representation = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            Self.writeSerializedData(data)
            print(path)
        } catch {
            print("Failed to save navigation data")
        }
    }

    func resetPath() {
        path = NavigationPath()
    }
}
