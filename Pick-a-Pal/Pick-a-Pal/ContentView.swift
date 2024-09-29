import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Paul", "John", "George", "Ringo"]
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            if !names.isEmpty {
                Text(pickedName.isEmpty ? "" : pickedName)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.tint)
            }
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                if names.isEmpty {
                    Text("Empty List")
                }
            }
            
            TextField("Add new name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty, !names.contains(nameToAdd) {
                        names.append(nameToAdd.trimmingCharacters(in: .whitespaces))
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return name == randomName
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick random name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .disabled(names.isEmpty)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
