//
//  Patterns.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI


struct Patterns: Hashable, Identifiable, Codable {
    let id: String
    let name: String
    var description: String?
    var videoName: String?
}
