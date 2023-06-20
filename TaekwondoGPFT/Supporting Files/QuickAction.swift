//
//  Action.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/05/2023.
//

import Combine
import Foundation
import SwiftUI

class ActionService: ObservableObject {
    static let shared = ActionService()
    @Published private var action: Action?
    private var cancellable: AnyCancellable?

    func setActionToHandle(action: Action?) {
        self.action = action
    }

    func handleShortcutItem(router: Router) {
        cancellable = $action.sink { action in
            router.resetPath()
            guard let action else { return }
            switch action.type {
            case ActionType.patternsAction.rawValue:
                router.path.append(Route.patterns)
            case ActionType.theoryAction.rawValue:
                router.path.append(Route.theory)
            case ActionType.onlineShopAction.rawValue:
                router.path.append(Route.shop)
            default:
                break
            }
        }
    }
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
