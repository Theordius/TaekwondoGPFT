//
//  PatternsDetailsViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import Foundation
import SwiftUI

extension PatternDetailView {
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
