import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .blue),
        Player(name: "Andre", score: 0, color: .yellow),
        Player(name: "Jasmine", score: 0, color: .green)
    ]
    
    var state = GameState.setup
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
