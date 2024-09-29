import SwiftUI

struct Address {
    let address: String
    let city: String
    let country: String
}

struct ContentView: View {
    @State var addressList: [Address] = []
    
    @State var address: String = ""
    @State var city: String = ""
    @State var country: String = ""
    @State var isShowingAddress: Bool = false
    
    var body: some View {
        VStack {
            Text("Address Label")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.bottom, 8)
            
            List {
                ForEach(addressList, id: \.address) { address in
                    VStack(alignment: .leading) {
                        Text("Address: \(address.address)")
                        Text("City: \(address.city)")
                        Text("Country: \(address.country)")
                    }
                    .padding(.vertical, 8)
                }
            }
            .overlay {
                if addressList.isEmpty {
                    Text("Empty List")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            
            .background(Color.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Spacer()
            
            VStack {
                CustomTextField(value: $address, placeholder: "Address", isLastItem: false)
                CustomTextField(value: $city, placeholder: "City", isLastItem: false)
                CustomTextField(value: $country, placeholder: "Country", isLastItem: true)
                
            }
            .padding()
            .background(Color.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Button("Add To Address") {
                if !address.isEmpty, !city.isEmpty, !country.isEmpty {
                    addressList.append(Address(address: address, city: city, country: country))
                    
                    address = ""
                    city = ""
                    country = ""
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(.primary)
    }
}

#Preview {
    ContentView()
}

struct CustomTextField: View {
    let value: Binding<String>
    let placeholder: String
    let isLastItem: Bool
    
    var body: some View {
        TextField("",
                  text: value,
                  prompt: Text(placeholder)
            .foregroundStyle(.gray)
        )
        .foregroundStyle(.white)
        .font(.system(size: 20))
        
        if !isLastItem {
            Divider()
                .background(.white)
        }
    }
}
