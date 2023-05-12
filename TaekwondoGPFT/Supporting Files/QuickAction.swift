//
//  QuickAction.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/05/2023.
//

import Foundation
import SwiftUI

class QuickActionObservable: ObservableObject {
    @Published var selectedAction: QuickAction?
}

struct QuickAction: Hashable {
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

enum ActionTypes: CaseIterable {
    case patternsAction
    case theoryAction
    case onlineShopAction

    var instance: QuickAction {
        switch self {
        case .patternsAction: return QuickAction(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionOne",
                title: "Układy Formalne",
                subtitle: "Układy Formalne",
                icon: "figure.martial.arts"
            )

        case .theoryAction: return QuickAction(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionTwo",
                title: "Teoria Taekwon-do",
                subtitle: "Teoria TKD",
                icon: "book"
            )

        case .onlineShopAction: return QuickAction(
                type: "pl.rgkonsulting.TaekwondoGPFT.actionThree",
                title: "Sklep Online",
                subtitle: "Sklep Online",
                icon: "cart"
            )
        }
    }
}

let allDynamicActions: [QuickAction] = [
    ActionTypes.patternsAction.instance,
    ActionTypes.theoryAction.instance,
    ActionTypes.onlineShopAction.instance,
]

func getAction(_ typeString: String) -> QuickAction? {
    if let action = ActionTypes.allCases.first(where: { $0.instance.type == typeString }) {
        return action.instance
    } else {
        return nil
    }
}
