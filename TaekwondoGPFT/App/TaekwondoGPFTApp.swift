//
//  TaekwondoGPFSApp.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

@main
struct TaekwondoGPFT: App {
    @Environment(\.scenePhase) var phase
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
        .onChange(of: phase) { phase in
            if phase == .active {
                QuickAction.setupQuickActions()
            }
        }
    }
}
