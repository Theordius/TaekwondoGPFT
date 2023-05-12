import Foundation

final class NewJSONLoader<Provider: JSONModelProviding> {
    enum TestError: Error, Equatable {
        case fileNotFound(_ message: String = "File not found")
        case fileDataCorrupted(_ message: String = "Data file is corrupted")
    }

    func loadJSON() throws -> Provider.Model {
        let data: Data
        let filename = Provider.string
        
        guard
            let file = Bundle.main.url(
                forResource: filename,
                withExtension: nil
            )
        else {
            throw TestError.fileNotFound("Could not find \(filename) in main bundle")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            throw TestError.fileNotFound("Couldn't load \(filename) from main bundle: \n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Provider.Model.self, from: data)
        } catch {
            throw TestError.fileDataCorrupted("Couldn't parse \(filename) as \(Provider.Model.self):\n\(error)")
        }
    }
}
