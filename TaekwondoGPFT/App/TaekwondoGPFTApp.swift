//
//  TaekwondoGPFSApp.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import Combine
import SwiftUI

@main
struct TaekwondoGPFT: App {
    @StateObject var router = Router()
    @Environment(\.scenePhase) var phase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private var actionService = ActionService.shared

    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(actionService)
                .environmentObject(router)
                // Deep Link functionality
                .onOpenURL { url in
                    if url.scheme == "navStack" {
                        if url.host == "patterns" {
                            router.path.append(Route.patterns)
                        } else if url.host == "theory" {
                            router.path.append(Route.theory)
                        } else {
                            router.resetPath()
                        }
                    }
                }
        }

        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                actionService.handleShortcutItem(router: router)
                print("App become active")

            case .inactive:
                print("App is inactive")

            case .background:
                // add quick actions
                print("App is in background")
                var shortcutItems = UIApplication.shared.shortcutItems ?? []
                if shortcutItems.isEmpty {
                    for action in allDynamicActions {
                        shortcutItems.append(
                            action.setupQuickActions()
                        )
                    }
                }
                UIApplication.shared.shortcutItems = shortcutItems
            @unknown default:
                print("Default - unexpected value")
            }
        }
    }
}
