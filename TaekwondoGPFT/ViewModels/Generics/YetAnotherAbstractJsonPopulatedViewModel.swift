//
//  YetAnotherAbstractJsonPopulatedViewModel.swift
//  TaekwondoGPFT
//
//  Created by Piotr Sienkiewicz on 27/04/2023.
//

import Foundation


@MainActor
final class YetAnotherAbstractJsonPopulatedViewModel<
    JSONModelProvider: JSONModelProviding
>: ObservableObject {
    typealias Model = JSONModelProvider.Model
    
    @Published var modelState: ModelState<Model> = .loading
    
    private let loader: NewJSONLoader<JSONModelProvider>
    private let appMonitoring: AppMonitoring
    
    init(
        loader: NewJSONLoader<JSONModelProvider> = .init(),
        appMonitoring: AppMonitoring = AppMonitoring()
    ) {
        self.loader = loader
        self.appMonitoring = appMonitoring
    }
    
    func loadDataAsync() {
        Task {
            await loadData()
        }
    }
    
    func loadData() async {
        do {
            sleep(3) /// fake delay.
            let model = try loader.loadJSON()
            modelState = .loadded(model: model)
        } catch {
            appMonitoring.recordError()
            modelState = .failure(error)
        }
    }
}
