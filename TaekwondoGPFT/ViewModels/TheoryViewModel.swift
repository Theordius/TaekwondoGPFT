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
        @Published var theory: [Theory] = []
         
         init?(
            fileName: String = "Theory.json",
            loader: JSONLoader = JSONLoader(),
            appMonitoring: AppMonitoring = AppMonitoring()
         ) {
             do {
                 theory = try loader.loadJSON(fileName)
             } catch {
                 appMonitoring.record(
                    error: .jsonDecodingFailure(undelyingError: error)
                 )
                 
                 return nil
             }
         }
     }
 }
