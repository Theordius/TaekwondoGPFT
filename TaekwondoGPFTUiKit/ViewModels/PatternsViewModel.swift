//
//  PatternsViewModel.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import UIKit

class PatternsViewModel {
    public var patterns = [Patterns]()
    
    init() {
        let loader = JSONLoader()
        do {
            patterns = try loader.loadJSON("Patterns.json")
        } catch {
            fatalError("File not found")
        }
    }
}
