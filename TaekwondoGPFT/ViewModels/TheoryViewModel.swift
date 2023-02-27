//
//  TheoryViewModel.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import UIKit

class TheoryViewModel {
    public var theory: [Theory]
    
    init() {
        let loader = JSONLoader()
        do {
            theory = try loader.loadJSON("Theory.json")
        } catch {
            fatalError("File not found")
        }
    }
}
