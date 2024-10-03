import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilteredMovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FilteredFriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
