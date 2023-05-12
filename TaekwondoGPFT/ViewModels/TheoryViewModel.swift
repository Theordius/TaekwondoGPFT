//
//  TheoryViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

extension TheoryView {
    typealias ViewModel3 = AnotherAbstractJsonPopulatedViewModel<[Theory], TeoryFileName>
    typealias ViewModel2 = AbstractJsonPopulatedViewModel<[Theory]>
    typealias ViewModel = YetAnotherAbstractJsonPopulatedViewModel<TheoryModelProvider>
}
