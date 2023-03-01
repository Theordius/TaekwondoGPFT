//
//  TheoryDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import Foundation
import SwiftUI

class TheoryDetailsViewModel {
    
    public var theory: [Theory] = Bundle.main.decode("Theory.json")
    
}
