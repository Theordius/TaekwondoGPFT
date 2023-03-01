//
//  TheoryViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

class TheoryViewModel {
    public var theory: [Theory] = Bundle.main.decode("Theory.json")
    
}
