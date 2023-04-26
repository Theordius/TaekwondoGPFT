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
        @Published public var theory: [Theory] = []
        
        private let loader = JSONLoader()
        private let fileName: String = "Theory.json"
        private let appMonitoring: AppMonitoring = AppMonitoring()
        
        init?() {
            do {
                theory = try loader.loadJSON(fileName)
            } catch {
                appMonitoring.recordError()
                return nil
            }
        }
    }
}
