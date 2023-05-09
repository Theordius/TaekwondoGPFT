//
//  YetAnotherAbstractJsonPopulatedViewModel.swift
//  TaekwondoGPFT
//
//  Created by Piotr Sienkiewicz on 27/04/2023.
//

import Foundation

class YetAnotherAbstractJsonPopulatedViewModel<
    JSONModelProvider: JSONModelProviding
>: ObservableObject {
    @Published var model: JSONModelProvider.Model

    init?(
        loader: JSONLoader = JSONLoader(),
        appMonitoring: AppMonitoring = AppMonitoring()
    ) {
        do {
            model = try loader.loadJSON(JSONModelProvider.string)
        } catch {
            appMonitoring.recordError()
            return nil
        }
    }
}

protocol JSONModelProviding {
    associatedtype Model: Decodable
    static var string: String { get }
}

enum PatternsModelProvider: JSONModelProviding {
    typealias Model = [Patterns]
    static var string = "Patterns.json"
}

enum TheoryModelProvider: JSONModelProviding {
    typealias Model = [Theory]
    static var string = "Theory.json"
}
