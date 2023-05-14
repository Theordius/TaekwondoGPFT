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

enum ActionTypes: String, CaseIterable {
    case patternsAction = "pl.rgkonsulting.TaekwondoGPFT.actionOne"
    case theoryAction = "pl.rgkonsulting.TaekwondoGPFT.actionTwo"
    case onlineShopAction = "pl.rgkonsulting.TaekwondoGPFT.actionThree"

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

let allDynamicActions: [QuickAction] = ActionTypes.allCases.map(\.instance)

extension QuickAction {
    static func getAction(_ typeString: String) -> QuickAction? {
        let action = ActionTypes(rawValue: typeString)
        return action?.instance
    }
}
