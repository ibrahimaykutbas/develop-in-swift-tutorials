import Foundation
import SwiftData

@Model
final class Friend {
    var name: String
    var gifts = [Gift]()
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "John"),
        Friend(name: "Paul"),
        Friend(name: "George"),
        Friend(name: "Ringo")
    ]
}
