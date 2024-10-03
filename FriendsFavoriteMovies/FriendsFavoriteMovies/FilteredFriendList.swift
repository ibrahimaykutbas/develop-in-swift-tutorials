import SwiftUI

struct FilteredFriendList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            FriendList(nameFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
}

#Preview {
    FilteredFriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
