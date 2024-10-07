import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    
    var colorPallete: [Color] = [.blue, .yellow, .green, .red, .orange]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(
                doesHighesScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
            .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(player.color)
                            }
                            TextField("Name", text: $player.name)
                                .foregroundColor(player.color)
                                .disabled(scoreboard.state != .setup)
                        }
                        
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        
                        Stepper("\(player.score)", value: $player.score, in: 0...20)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0, color: colorPallete.randomElement()! ))
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoints)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                }
                
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
