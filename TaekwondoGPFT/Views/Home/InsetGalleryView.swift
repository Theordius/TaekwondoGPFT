//
//  InsetGalleryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 29/03/2023.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES

    let gallery: Gallery

    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(gallery.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: LOOP
            } //: HSTACK
        } // SCROLL
    }
}

// MARK: - PREVIEW

struct InsetGalleryView_Previews: PreviewProvider {
    static let gallery: [Gallery] = Bundle.main.decode("Gallery.json")
    static var previews: some View {
        InsetGalleryView(gallery: gallery[0])
    }
}
