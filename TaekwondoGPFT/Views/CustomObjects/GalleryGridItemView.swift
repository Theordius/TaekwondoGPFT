//
//  GalleryGridItemView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 29/03/2023.
//

import SwiftUI

struct GalleryGridItemView: View {
    //MARK: - PROPERTIES
    let gallery: Gallery
    
    //MARK: - BODY
    var body: some View {
        Image(gallery.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: - PREVIEW
struct GalleryGridItemView_Previews: PreviewProvider {
    static let gallery: [Gallery] = Bundle.main.decode("Gallery.json")
    static var previews: some View {
        GalleryGridItemView(gallery: gallery[0])
    }
}
