//
//  ButtonsStack.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 16/05/2023.
//

import SwiftUI

struct ButtonsStack: View {
    @EnvironmentObject var router: Router

    // MARK: - BODY

    var body: some View {
        VStack {
            CustomButton(
                title: String(localized: "UKŁADY FORMALNE"),
                subtitle: String(localized: "Układy Formalne"),
                action: { router.path.append(Route.patterns) }
            )
            CustomButton(
                title: String(localized: "TEORIA"),
                subtitle: String(localized: "Teoria Taekwon - DO"),
                action: { router.path.append(Route.theory) }
            )
            CustomButton(
                title: String(localized: "SKLEP ONLINE"),
                subtitle: String(localized: "Nasz sklep Online"),
                action: { router.path.append(Route.shop) }
            )
            CustomButton(
                title: String(localized: "KALENDARZ"),
                subtitle: String(localized: "Kalendarz Imprez"),
                action: { router.path.append(Route.calendar) }
            )
        }
        .padding(.vertical, -12)
        .buttonStyle(BlueCapsule())
    }
}
