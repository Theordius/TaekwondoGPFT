//
//  TheoryDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import Foundation
import SwiftUI

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
