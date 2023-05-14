//
//  AppDelegate.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 11/05/2023.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    var shortcutItemToProcess: UIApplicationShortcutItem?

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            shortcutItemToProcess = shortcutItem
        }

        let sceneConfiguration = UISceneConfiguration(
            name: "Custom Configuration",
            sessionRole: connectingSceneSession.role
        )

        sceneConfiguration.delegateClass = CustomSceneDelegate.self
        return sceneConfiguration
    }
}

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Environment(\.openURL) var openURL
    @State private var isShowingPatternsView = false
    @State private var isShowingTheoryView = false

    var shortcutItemToProcess: UIApplicationShortcutItem?
    var patternsIdentifier = "patterns"

    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        shortcutItemToProcess = shortcutItem
        handleShortcutItem(shortcutItem)

        // windowScene.keyWindow?.rootViewController = UIHostingController(rootView: PatternsView())
        // quickActionObservable.selectedAction = QuickAction.getAction(shortcutItem.type)
    }

    func handleShortcutItem(_ shortuctItem: UIApplicationShortcutItem) {
        if let actionTypeValue = ActionTypes(rawValue: shortuctItem.type) {
            switch actionTypeValue {
            case .patternsAction:
                if shortuctItem.type == "pl.rgkonsulting.TaekwondoGPFT.actionOne" {
                    print("Action One was pressed")
                    navigateToPatternsView()
                }

            case .theoryAction:
                if shortuctItem.type == "pl.rgkonsulting.TaekwondoGPFT.actionTwo" {
                    print("Action Two was pressed")
                }
            case .onlineShopAction:
                if shortuctItem.type == "pl.rgkonsulting.TaekwondoGPFT.actionThree" {
                    print("Action Three was pressed")
                }
            }
        }
    }

    func navigateToPatternsView() {
        let patternsView = PatternsView()
        _ = NavigationStack { patternsView }
    }
}
