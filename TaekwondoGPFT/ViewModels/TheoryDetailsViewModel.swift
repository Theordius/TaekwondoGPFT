//
//  TheoryDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import Foundation
import SwiftUI

extension TheoryDetailView {
    class ViewModel: ObservableObject {
        @Published public var theory: [Theory] = Bundle.main.decode("Theory.json")
    }
}
