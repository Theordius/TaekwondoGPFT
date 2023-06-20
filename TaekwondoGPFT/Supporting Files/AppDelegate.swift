//
//  AppDelegate.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 11/05/2023.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    private let actionService = ActionService.shared
    // var shortcutItemToProcess: UIApplicationShortcutItem?

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            actionService.action = Action.getAction(shortcutItem)
        }

        let sceneConfiguration = UISceneConfiguration(
            name: connectingSceneSession.configuration.name,
            sessionRole: connectingSceneSession.role
        )

        sceneConfiguration.delegateClass = SceneDelegate.self
        return sceneConfiguration
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    private let actionService = ActionService.shared
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        // (UIApplication.shared.delegate as? AppDelegate)?.shortcutItemToProcess = shortcutItem
        actionService.action = Action.getAction(shortcutItem)
        completionHandler(true)
    }
}
