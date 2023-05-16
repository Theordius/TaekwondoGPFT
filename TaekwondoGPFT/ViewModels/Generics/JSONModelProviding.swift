import Foundation

protocol JSONModelProviding {
    associatedtype Model: Decodable
    static var string: String { get }
}
