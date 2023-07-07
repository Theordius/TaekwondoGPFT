//
//  MainScreen.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct MainScreen: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var router: Router

    private let mainPage = String(localized: "Strona Główna")
    private let timer = String(localized: "Timer")
    private let goAndFight = String(localized: "Go & Fight")
    private let gallery = String(localized: "Galeria")

    // MARK: - BODY

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "figure.martial.arts")
                    Text(mainPage)
                }
                .tag(0)

            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text(timer)
                }
                .tag(1)

            GoAndFightView()
                .tabItem {
                    Image("go&fight")
                    Text(goAndFight)
                }
                .tag(2)

            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text(gallery)
                }
                .tag(3)
        } //: TAB
    }
}

// MARK: - PREVIEW

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(Router())
    }
}
