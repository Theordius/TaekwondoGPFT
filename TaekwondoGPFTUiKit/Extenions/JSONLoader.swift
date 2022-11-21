//
//  JSONLoader.swift
//  TesterAssistant
//
//  Created by Rafał Gęsior on 06/06/2022.
//

import Foundation

final class JSONLoader {
    
    enum TestError: Error, Equatable {
        case fileNotFound(_ message: String = "")
        case fileDataCorrupted(_ message: String = "")
    }
    
    func loadJSON<T: Decodable>(_ filename: String) throws ->  T  {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            throw TestError.fileNotFound("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw TestError.fileNotFound("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw TestError.fileDataCorrupted("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
