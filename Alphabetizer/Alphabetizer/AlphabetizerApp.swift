import SwiftUI

@main
struct AlphabetizerApp: App {
    @State private var alphabetizer = Alphabetizer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(alphabetizer)
        }
    }
}
