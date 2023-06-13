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
            name: connectingSceneSession.configuration.name,
            sessionRole: connectingSceneSession.role
        )

        sceneConfiguration.delegateClass = CustomSceneDelegate.self
        return sceneConfiguration
    }
}

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var shortcutItemToProcess: UIApplicationShortcutItem?
    var patternsIdentifier = "patterns"

    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        shortcutItemToProcess = shortcutItem
        handleShortcutItem(shortcutItem)
    }

    func handleShortcutItem(_ shortuctItem: UIApplicationShortcutItem) {
        guard let actionTypeValue = ActionTypes(rawValue: shortuctItem.type) else { return }
        switch actionTypeValue {
        case .patternsAction:
            print("Action One was pressed")

        case .theoryAction:
            print("Action Two was pressed")

        case .onlineShopAction:
            print("Action Three was pressed")
        }
    }
}
