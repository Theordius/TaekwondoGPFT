//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                CustomBackground()
                VStack(alignment: .center, spacing: 35) {
                    Group {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)

                        Text("")
                        ButtonsStack()
                            .navigationDestination(for: Route.self) { $0 }

                        Spacer()
                    }

                    .buttonStyle(BlueCapsule())
                    .padding(.vertical, -12)
                } // VSTACK
            } //: ZSTACK
        } //: NAVIGATION STACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(Router())
                .previewLayout(.sizeThatFits)
        }
    }
}
