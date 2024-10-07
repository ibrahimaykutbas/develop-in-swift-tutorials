import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
