//
//  TheoryDetailsViewModel.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import Foundation
import UIKit

class TheoryDetailsViewModel {
    
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
