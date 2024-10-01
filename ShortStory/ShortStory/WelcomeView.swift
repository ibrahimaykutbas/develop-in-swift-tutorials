import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Zamanın Yansımaları")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.monospaced)
                .padding(.bottom, 2)
            
            Text("ChatGPT")
                .font(.title2)
                .fontWeight(.semibold)
                .fontDesign(.monospaced)
                .padding(.bottom, 40)
                
            
            Text("'İki evrenin kaderi, onun ellerindeydi.'")
                .font(.callout)
                .fontWeight(.medium)
                .fontDesign(.monospaced)
        }
    }
}

#Preview {
    WelcomeView()
}
