//
//  MainScreen.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct MainScreen: View {
    // MARK: - PROPERTIES

    private let mainPage = String(localized: "Strona Główna")
    private let timer = String(localized: "Timer")
    private let ourSections = String(localized: "Nasze Sekcje")
    private let gallery = String(localized: "Galeria")

    // MARK: - BODY

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "figure.martial.arts")
                    Text(mainPage)
                }

            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text(timer)
                }

            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text(ourSections)
                }

            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text(gallery)
                }
        } //: TAB
    }
}

// MARK: - PREVIEW

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
