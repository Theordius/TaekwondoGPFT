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

                        Spacer()
                    }

                    .buttonStyle(BlueCapsule())
                    .padding(.vertical, -12)
                } // VSTACK
                //  .environmentObject(router)
            }
            .navigationDestination(for: Route.self) { destination in
                ViewFactory.viewForDestination(destination)
            }
        } // ZSTACK
//        .navigationDestination(for: Route.self) { destination in
//            ViewFactory.viewForDestination(destination)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                //    .environmentObject(Router())
                .previewLayout(.sizeThatFits)
        }
    }
}
