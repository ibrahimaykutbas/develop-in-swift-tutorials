import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    @State private var newFriend: Friend?
    @State private var searchText = ""
    
    init(nameFilter: String = "") {
        let predicate = #Predicate<Friend> { friend in
            nameFilter.isEmpty || friend.name.localizedStandardContains(nameFilter)
        }
        
        _friends = Query(filter: predicate, sort: \Friend.name)
    }
    
    var body: some View {
        VStack {
            if !friends.isEmpty {
                List {
                    ForEach(friends) { friend in
                        NavigationLink {
                            FriendDetail(friend: friend)
                        } label: {
                            Text(friend.name)
                        }
                    }
                    .onDelete(perform: deleteFriend)
                }
            } else {
                ContentUnavailableView {
                    Label("No Friends", systemImage: "person.and.person")
                }
            }
        }
        .navigationTitle("Friends")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            
            ToolbarItem {
                Button(action: addFriend) {
                    Label("Add Friend", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newFriend) { friend in
            NavigationStack {
                FriendDetail(friend: friend, isNew: true)
            }
            .interactiveDismissDisabled()
        }
        .searchable(text: $searchText)
    }
    
    private func addFriend() {
        withAnimation {
            let friend = Friend(name: "")
            modelContext.insert(friend)
            newFriend = friend
        }
    }
    
    private func deleteFriend(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(friends[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        FriendList()
            .modelContainer(for: Friend.self, inMemory: true)
    }
}

#Preview("Filtered") {
    NavigationStack {
        FriendList(nameFilter: "p")
            .modelContainer(SampleData.shared.modelContainer)
    }
}
