//
//  QuickAction.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/05/2023.
//

import SwiftUI

struct QuickAction {
    static func setupQuickActions() {
        let actionOne = UIApplicationShortcutItem(
            type: "pl.rgkonsulting.TaekwondoGPFT.actionOne",
            localizedTitle: "Układy Formalne",
            localizedSubtitle: "Układy Formalne TKD",
            icon: UIApplicationShortcutIcon(systemImageName: "figure.martial.arts"),
            userInfo: ["detailView": "patterns" as NSSecureCoding]
        )
        let actionTwo = UIApplicationShortcutItem(
            type: "pl.rgkonsulting.TaekwondoGPFT.actionTwo",
            localizedTitle: "Teoria TKD",
            localizedSubtitle: "Teoria",
            icon: UIApplicationShortcutIcon(systemImageName: "book"),
            userInfo: nil
        )
        let actionThree = UIApplicationShortcutItem(
            type: "pl.rgkonsulting.TaekwondoGPFT.actionThree",
            localizedTitle: "Sklep Online",
            localizedSubtitle: "Sklep Online",
            icon: UIApplicationShortcutIcon(systemImageName: "cart"),
            userInfo: nil
        )

        let quickActions = [actionOne, actionTwo, actionThree]
        UIApplication.shared.shortcutItems = quickActions
    }
}
