//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var quickActionObservable: QuickActionObservable
    @State private var activeLink: Bool = false

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

                        ButtonsStack()
//
                        Spacer()
                    }
                    .padding(.vertical, -12)
                } // VSTACK
            } // ZSTACK
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
