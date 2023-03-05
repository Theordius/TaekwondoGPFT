//
//  PatternsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

extension PatternsView {
    class ViewModel: ObservableObject {
       @Published public var patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    }
}
