//
//  PatternsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

extension PatternsView {
    class ViewModel: ObservableObject {
        @Published public var patterns: [Patterns] = []
        
        private let loader = JSONLoader()
        private let fileName: String = "Patterns.json"
        private let appMonitoring: AppMonitoring = AppMonitoring()
        
        init?() {
            do {
                patterns = try loader.loadJSON(fileName)
            } catch {
                appMonitoring.recordError()
                return nil
            }
        }
    }
}
