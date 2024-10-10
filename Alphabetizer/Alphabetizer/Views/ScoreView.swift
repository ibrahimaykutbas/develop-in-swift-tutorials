import SwiftUI

struct ScoreView: View {
    @State private var score = 0

    var body: some View {
        Text("Score: \(score)")
            .font(.largeTitle)
            .foregroundStyle(Color.purple)
            .bold()
    }
}

#Preview {
    ScoreView()
}
