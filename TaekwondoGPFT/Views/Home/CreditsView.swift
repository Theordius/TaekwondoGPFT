//
//  CreditsView.swift
//  Animals
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        VStack {
            Image("rgkonsulting")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
            Copyright © Rafal Gesior
            All right reserved
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
    }
}

// MARK: - PREVIEW

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
