//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by İbrahim Aykut BAŞ on 29.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Knock, knock!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
            
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
            
            Text("It's me")
                .padding()
                .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 8))
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
