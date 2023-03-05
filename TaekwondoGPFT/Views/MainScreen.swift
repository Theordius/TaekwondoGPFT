//
//  MainScreen.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct MainScreen: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "figure.martial.arts")
                    Text("Strefa Trenera")
                }
            
           TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Mapa")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Galeria")
                }
            
        } //: TAB
    }
}

//MARK: - PREVIEW
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
