import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .modelContainer(SampleData.shared.modelContainer)
            .navigationTitle("Friends")
    }
}
