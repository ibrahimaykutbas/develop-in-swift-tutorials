import SwiftUI

struct DiceView: View {
    @State private var numberOdPips: Int = 1
    
    func roll() {
        withAnimation{
            numberOdPips = Int.random(in: 1...6)
        }
    }
    
    var body: some View {
        VStack {
            Button(action: roll) {
                Image(systemName: "die.face.\(numberOdPips).fill")
                    .resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.black, .white)
            }
            
            //            Image(systemName: "die.face.\(numberOdPips).fill")
            //                .resizable()
            //                .frame(maxWidth: 100, maxHeight: 100)
            //                .aspectRatio(1, contentMode: .fit)
            //                .foregroundStyle(.black, .white)
            //
            //            Button("Roll") {
            //                withAnimation {
            //                    numberOdPips = Int.random(in: 1...6)
            //                }
            //            }
            //            .buttonStyle(.bordered)
            //            .buttonBorderShape(.capsule)
        }
    }
}

#Preview {
    DiceView()
}
