//
//  AppMonitoring.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 26/04/2023.
//

import Foundation

struct AppMonitoring {
    enum Error: Swift.Error {
        case jsonDecodingFailure(underlyingError: Swift.Error)
    }

    func recordError() { }
}
