import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    
    @Query private var gifts: [Gift]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var gift: String = ""
    
    let isNew: Bool
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Name", text: $friend.name)
                        .autocorrectionDisabled()
                }
                
                if !friend.gifts.isEmpty {
                    Section(header: Text("Gifts")) {
                        ForEach($friend.gifts) { $gift in
                            TextField("Title", text: $gift.title)
                        }
                        .onDelete(perform: deleteFriend)
                    }
                }
            }
            
            Spacer()
            
            if !isNew {
                Group {
                    TextField("New Gift", text: $gift)
                        .padding()
                    
                    Button("Add Gift") {
                        friend.gifts.append(Gift(title: gift))
                        gift = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title2)
                    .disabled(gift.isEmpty)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func deleteFriend(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(friend.gifts[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
