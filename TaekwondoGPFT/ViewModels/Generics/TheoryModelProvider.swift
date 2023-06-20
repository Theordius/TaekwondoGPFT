import Foundation

enum TheoryModelProvider: JSONModelProviding {
    typealias Model = [Theory]
    static var string = "Theory.json"
}
