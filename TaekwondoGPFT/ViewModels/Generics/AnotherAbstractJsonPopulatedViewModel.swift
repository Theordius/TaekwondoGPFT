//
//  AnotherAbstractJsonPopulatedViewModel.swift
//  TaekwondoGPFT
//
//  Created by Piotr Sienkiewicz on 27/04/2023.
//

import Foundation

class AnotherAbstractJsonPopulatedViewModel<
    Model: Decodable,
    FileName: FileNameProviding
>: ObservableObject {
    @Published var model: Model

    init?(
        loader: JSONLoader = JSONLoader(),
        appMonitoring: AppMonitoring = AppMonitoring()
    ) {
        do {
            model = try loader.loadJSON(FileName.value)
        } catch {
            appMonitoring.recordError()
            return nil
        }
    }
}

protocol FileNameProviding {
    static var value: String { get }
}

enum TeoryFileName: FileNameProviding {
    static let value: String = "Theory.json"
}

enum PatternsFileName: FileNameProviding {
    static let value: String = "Patterns.json"
}
