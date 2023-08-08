//
//  TheoryDetailView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import SwiftUI

struct TheoryDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var router: Router

    var theory: Theory

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .center, spacing: 26) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .padding()

            Text("")

            Divider().padding(.horizontal, 6)

            Text(theory.name)
                .font(.headline)
                .foregroundColor(.blue)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGrayLight, .customGrayMedium],
                        startPoint: .top, endPoint: .bottom
                    )
                )

            Divider().padding(.horizontal, 6)

            ScrollView(showsIndicators: false) {
                ZStack {
                    CustomTextBackround()
                    VStack(alignment: .leading, spacing: 4) {
                        Text(theory.description ?? "To be done")
                            .modifier(DescriptionTextModifier())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.all)
                }
                .padding()
            }

            Button("Strona Główna") {
                router.resetPath()
            }

            .buttonStyle(.borderedProminent)
            Spacer()
        }

        .padding(.vertical, 4)
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
