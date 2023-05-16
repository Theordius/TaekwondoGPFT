//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

enum Route: Hashable {
    case patterns(Patterns)
    case theory(Theory)
    case onlineShop(OnlineShop)
}

struct ContentView: View {
    @EnvironmentObject var quickActionObservable: QuickActionObservable
    @State private var activeLink: Bool = false

    @State private var path: [Route] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.gray, .white]))
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 35) {
                    Group {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)

                        Text("")

                        ButtonsStack()
                            .navigationDestination(for: Route.self) { route in
                                switch route {
                                case .patterns:
                                    PatternsView()
                                case .theory:
                                    TheoryView()
                                case .onlineShop:
                                    WebView()
                                }
                            }
                        Spacer()
                    }
                    .padding(.vertical, -12)
                } // VSTACK
            } // ZSTACK
        } // Navigation Path
    }

    func navigateTo(route: Route) {
        path.append(route)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}
