//
//  TheoryViewModel.swift
//  TaekwondoGPFTU
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import Foundation
import SwiftUI

extension TheoryView {
    final class ViewModel: ObservableObject {
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

