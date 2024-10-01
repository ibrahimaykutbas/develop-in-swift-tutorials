import SwiftUI

struct DiceView: View {
    @State private var numberOdPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOdPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll") {
                withAnimation {
                    numberOdPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
