//
//  Action.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/05/2023.
//

import Foundation
import SwiftUI

class ActionService: ObservableObject {
    static let shared = ActionService()
    @Published var action: Action?
}

enum ActionType: String, CaseIterable {
    case patternsAction = "pl.rgkonsulting.TaekwondoGPFT.actionOne"
    case theoryAction = "pl.rgkonsulting.TaekwondoGPFT.actionTwo"
    case onlineShopAction = "pl.rgkonsulting.TaekwondoGPFT.actionThree"

    var instance: Action {
        switch self {
        case .patternsAction: return Action(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionOne",
                title: "Układy Formalne",
                subtitle: "Układy Formalne",
                icon: "figure.martial.arts"
            )

        case .theoryAction: return Action(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionTwo",
                title: "Teoria Taekwon-do",
                subtitle: "Teoria TKD",
                icon: "book"
            )

        case .onlineShopAction: return Action(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionThree",
                title: "Sklep Online",
                subtitle: "Sklep Online",
                icon: "cart"
            )
        }
    }
}

struct Action: Hashable, Equatable {
    var type: String
    var title: String
    var subtitle: String
    var icon: String

    func setupQuickActions() -> UIApplicationShortcutItem {
        UIApplicationShortcutItem(
            type: type,
            localizedTitle: title,
            localizedSubtitle: subtitle,
            icon: .init(systemImageName: icon),
            userInfo: ["type": type as NSSecureCoding]
        )
    }
}

let allDynamicActions: [Action] = ActionType.allCases.map(\.instance)

extension Action {
    static func getAction(_ typeString: String) -> Action? {
        let action = ActionType(rawValue: typeString)
        return action?.instance
    }

    static func getAction(_ shortcutItem: UIApplicationShortcutItem) -> Action? {
        getAction(shortcutItem.type)
    }
}
