import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", isRaing: false, high: 70, low: 60)
            
            DayForecast(day: "Tue", isRaing: true, high: 60, low: 50)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRaing: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRaing {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRaing {
            return .blue
        } else {
            return .yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .padding(4)
                .font(.largeTitle)
            
            Text("High: \(high)")
                .fontWeight(.semibold)
            Text("Low: \(low)")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
