//
//  PatternsDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import Foundation
import SwiftUI

class PatternsDetailsViewModel {
    public var patterns: [Patterns]
    
    init() {
        let loader = JSONLoader()
        do {
            patterns = try loader.loadJSON("Patterns.json")
        } catch {
            fatalError("File not found")
        }
    }
}
