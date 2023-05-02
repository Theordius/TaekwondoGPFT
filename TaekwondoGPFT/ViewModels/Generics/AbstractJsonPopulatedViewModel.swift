//
//  AbstractJsonPopulatedViewModel.swift
//  TaekwondoGPFT
//
//  Created by Piotr Sienkiewicz on 27/04/2023.
//

import Foundation

class AbstractJsonPopulatedViewModel<Model: Decodable>: ObservableObject {
    @Published var model: Model
    
    init?(
        fileName: String,
        loader: JSONLoader = JSONLoader(),
        appMonitoring: AppMonitoring = AppMonitoring()
    ) {
        do {
            model = try loader.loadJSON(fileName)
        } catch {
            appMonitoring.recordError()
            return nil
        }
    }
}

extension AbstractJsonPopulatedViewModel where Model == [Theory] {
    convenience init?() {
        self.init(fileName: "Theory.json")
    }
}
