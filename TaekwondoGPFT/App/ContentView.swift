//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.gray, .white]))
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 35) {
                    Group {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)

                        Text("")

                        CustomButton(title: String(localized: "UKŁADY FORMALNE"), subtitle: String(localized: "Układy Formalne"), tag: "A")
                        CustomButton(title: String(localized: "TEORIA"), subtitle: String(localized: "Teoria Taekwon - DO"), tag: "B")
                        CustomButton(title: String(localized: "SKLEP ONLINE"), subtitle: String(localized: "Nasz sklep Online"), tag: "C")
                        CustomButton(title: String(localized: "KALENDARZ"), subtitle: String(localized: "Kalendarz Imprez"), tag: "D")

                        Spacer()
                    }

                    .padding(.vertical, -12)
                    .buttonStyle(BlueCapsule())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}
