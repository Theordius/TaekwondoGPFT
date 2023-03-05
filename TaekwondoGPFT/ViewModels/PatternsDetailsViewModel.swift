//
//  PatternsDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import Foundation
import SwiftUI

extension PatternDetailView {
    class ViewModel: ObservableObject {
        @Published public var patterns: [Patterns] = Bundle.main.decode("Patterns.json")
    }
}
