import Foundation

enum ModelState<Model> {
    case loading
    case loadded(model: Model)
    case failure(Error)
}
