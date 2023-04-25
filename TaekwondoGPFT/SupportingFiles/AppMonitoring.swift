//
//  AppMonitoring.swift
//  TaekwondoGPFT
//
//  Created by Piotr Sienkiewicz on 25/04/2023.
//

import Foundation

struct AppMonitoring {
    enum Error: Swift.Error {
        case jsonDecodingFailure(undelyingError: Swift.Error)
    }
    
    func record(error: Error) {
        // TODO add Firebase Crashlitics
    }
}
