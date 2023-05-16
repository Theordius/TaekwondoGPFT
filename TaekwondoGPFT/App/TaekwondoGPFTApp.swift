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
    let quickActionObservable = QuickActionObservable()
    var shortcutItemToProcess: UIApplicationShortcutItem?

    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(quickActionObservable)
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                print("App become active")
                guard let type = shortcutItemToProcess?.userInfo?["type"] as? String else {
                    return
                }
                quickActionObservable.selectedAction = QuickAction.getAction(type)
                print(type)
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
