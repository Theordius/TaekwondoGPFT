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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                // respond to selected action
                print("App become active")
            case .background:
                // add quick actions
                QuickAction.setupQuickActions()
            default:
                break
            }
        }
    }
}
