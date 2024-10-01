import SwiftUI

let gradientColors: [Color] = [
    Color.blue.opacity(0.8), Color.purple.opacity(0.7), Color.black.opacity(0.9)
]

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ChapterOneView()
            ChapterTwoView()
            ChapterThreeView()
        }
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
