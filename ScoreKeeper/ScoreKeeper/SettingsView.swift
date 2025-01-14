import SwiftUI

struct SettingsView: View {
    @Binding var doesHighesScoreWin: Bool
    @Binding var startingPoints: Int
    @Binding var winningPoint: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            
            Picker("Win condition", selection: $doesHighesScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
            Picker("Winning Point Total", selection: $winningPoint) {
                Text("10")
                    .tag(10)
                Text("20")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var doesHighesScoreWin = true
    @Previewable @State var startingPoints = 10
    @Previewable @State var winningPoint = 20
    SettingsView(doesHighesScoreWin: $doesHighesScoreWin, startingPoints: $startingPoints, winningPoint: $winningPoint)
}
