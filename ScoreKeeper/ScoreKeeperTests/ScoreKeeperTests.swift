import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {
    
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0, color: .blue),
            Player(name: "Andre", score: 5, color: .yellow)
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highes score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .blue),
                Player(name: "Andre", score: 5, color: .yellow)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 5, color: .yellow)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0, color: .blue),
                Player(name: "Andre", score: 5, color: .yellow)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0, color: .blue)])
    }
    
}
