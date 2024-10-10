import SwiftUI

struct SubmitButton: View {
    @Environment(Alphabetizer.self) private var alphabetizer
    
    var body: some View {
        Button {
            alphabetizer.submit()
        } label: {
            Image(systemName: "play.circle")
                .font(.system(size: 60))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.purple)
                    .opacity(isEnabled ? 1.0 : 0.5)
                )
        }
        .animation(.default, value: isEnabled)
        .disabled(!isEnabled)
    }
    
    var isEnabled: Bool {
        alphabetizer.message == .instructions
    }
}

#Preview {
    SubmitButton()
        .environment(Alphabetizer())
}
