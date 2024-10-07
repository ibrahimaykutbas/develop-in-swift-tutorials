import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .blue),
        Player(name: "Andre", score: 0, color: .yellow),
        Player(name: "Jasmine", score: 0, color: .green)
    ]
   
    var colorPallete: [Color] = [.blue, .yellow, .green, .red, .orange]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                            .foregroundColor(player.color)
                        Text("\(player.score)")
                        
                        Stepper("\(player.score)", value: $player.score, in: 0...20)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0, color: colorPallete.randomElement()! ))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
