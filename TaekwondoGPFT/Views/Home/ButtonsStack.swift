//
//  ButtonsStack.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 16/05/2023.
//

import SwiftUI

struct ButtonsStack: View {
    // MARK: - BODY

    var body: some View {
        VStack {
            CustomButton(
                title: String(localized: "UKŁADY FORMALNE"),
                subtitle: String(localized: "Układy Formalne")
            )

            CustomButton(
                title: String(localized: "TEORIA"),
                subtitle: String(localized: "Teoria Taekwon - DO")
            )
            CustomButton(
                title: String(localized: "SKLEP ONLINE"),
                subtitle: String(localized: "Nasz sklep Online")
            )
            CustomButton(
                title: String(localized: "KALENDARZ"),
                subtitle: String(localized: "Kalendarz Imprez")
            )
        }

        .padding(.vertical, -12)
        .buttonStyle(BlueCapsule())
    }
}

struct ButtonsStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsStack()
    }
}
