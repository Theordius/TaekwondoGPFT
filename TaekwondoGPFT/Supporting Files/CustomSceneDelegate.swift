//
//  CustomSceneDelegate.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 11/05/2023.
//

import SwiftUI

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    @Environment(\.openURL) var openURL

    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        handleShortcutItem(shortcutItem, completionHandler: completionHandler)
    }

    func handleShortcutItem(
        _ shortcutItem: UIApplicationShortcutItem,
        completionHandler: ((Bool) -> Void)? = nil
    ) {
        guard shortcutItem.type == "pl.rgkonsulting.TaekwondoGPFT.actionOne" else {
            completionHandler!(false)
            return
        }

        openURL(URL(string: "TaekwondoGPFT://patterns")!) { completed in
            completionHandler!(completed)
        }
    }
}
