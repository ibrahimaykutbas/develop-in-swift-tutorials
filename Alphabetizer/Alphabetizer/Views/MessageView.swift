import SwiftUI

struct MessageView: View {
    // TODO: Different messages after winning or losing the game
    @State private var message = "Place the tiles in alphabetical order"

    var body: some View {
        Text(message)
            .font(.largeTitle)
    }
}

#Preview {
    MessageView()
}
