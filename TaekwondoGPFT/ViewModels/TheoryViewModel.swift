//
//  TheoryViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

extension TheoryView {
    typealias ViewModel = AnotherAbstractJsonPopulatedViewModel<[Theory], TeoryFileName>
    typealias ViewModel2 = AbstractJsonPopulatedViewModel<[Theory]>
    typealias ViewModel3 = YetAnotherAbstractJsonPopulatedViewModel<TheoryModelProvider>
}
