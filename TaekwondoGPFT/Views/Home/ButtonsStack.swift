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
                subtitle: String(localized: "Układy Formalne"),
                destination: PatternsView()
            )

            CustomButton(
                title: String(localized: "TEORIA"),
                subtitle: String(localized: "Teoria Taekwon - DO"),
                destination: TheoryView()
            )
            CustomButton(
                title: String(localized: "SKLEP ONLINE"),
                subtitle: String(localized: "Nasz sklep Online"),
                destination: WebView()
            )
            CustomButton(
                title: String(localized: "KALENDARZ"),
                subtitle: String(localized: "Kalendarz Imprez"),
                destination: CalendarView()
            )
        }

        .padding(.vertical, -12)
        .buttonStyle(BlueCapsule())
    }
}

struct ButtonsStack_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ButtonsStack()
        }
    }
}
