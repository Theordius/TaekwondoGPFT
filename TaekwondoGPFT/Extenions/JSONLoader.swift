//
//  JSONLoader.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 23/04/2023.
//

import Foundation

final class JSONLoader {
    
    enum TestError: Error, Equatable {
        case fileNotFound(_ message: String = "File not found")
        case fileDataCorrupted(_ message: String = "Data file is corrupted")
    }
    
    func loadJSON<T: Decodable>(_ filename: String) throws -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            throw TestError.fileNotFound("Could not find \(filename) in main bundle")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw TestError.fileNotFound("Couldn't load \(filename) from main bundle: \n\(error)")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw TestError.fileDataCorrupted("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
