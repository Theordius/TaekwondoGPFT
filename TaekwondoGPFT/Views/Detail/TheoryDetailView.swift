//
//  TheoryDetailView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import SwiftUI

struct TheoryDetailView: View {
    // MARK: - PROPERTIES

    @StateObject var viewModel = Self.ViewModel()!
    @EnvironmentObject var router: Router

    var theory: Theory

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 26) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("")

            Divider().padding(.horizontal, 6)

            Text(theory.name)
                .font(.headline)
                .foregroundColor(.blue)

            Divider().padding(.horizontal, 6)

            Text(theory.description ?? "To be done")
                .font(.system(.subheadline))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(.max)
            Button("Strona Główna") {
                router.resetPath()
            }
            .buttonStyle(.borderedProminent)
        }

        .padding(.vertical, 5)
    }
}

struct TheoryDetailView_Previews: PreviewProvider {
    static let theory: [Theory] = Bundle.main.decode("Theory.json")
    static var previews: some View {
        NavigationStack {
            TheoryDetailView(theory: theory[0])
                .environmentObject(Router())
                .previewDevice("iPhone 11 Pro")
        }
    }
}
