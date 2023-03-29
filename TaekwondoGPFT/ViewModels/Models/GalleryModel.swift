//
//  GalleryModel.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 29/03/2023.
//

import SwiftUI

struct Gallery: Codable, Identifiable {
    let id: String
    let image: String
    let gallery: [String]
}
