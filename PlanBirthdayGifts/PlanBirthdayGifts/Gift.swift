import Foundation
import SwiftData

@Model
final class Gift {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    static let sampleData = [
        Gift(title: "Guitar"),
        Gift(title: "Bass Guitar"),
        Gift(title: "Drums"),
        Gift(title: "Piano"),
    ]
}
