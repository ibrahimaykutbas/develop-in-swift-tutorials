import SwiftUI

struct Day {
    let day: String
    let isRaining: Bool
    let high: Int
    let low: Int
}

struct WeatherData {
    let days: [Day]
    
    var averageHighAndLow: (averageHigh: Double, averageLow: Double) {
        let totalHigh = days.reduce(0) { $0 + $1.high }
        let totalLow = days.reduce(0) { $0 + $1.low }
        
        let averageHigh = Double(totalHigh) / Double(days.count)
        let averageLow = Double(totalLow) / Double(days.count)
        
        return (averageHigh, averageLow)
    }
}

struct ContentView: View {
    let days: [Day] = [
        Day(day: "Mon", isRaining: true, high: 24, low: 17),
        Day(day: "Tue", isRaining: true, high: 22, low: 17),
        Day(day: "Wed", isRaining: true, high: 21, low: 17),
        Day(day: "Thu", isRaining: false, high: 22, low: 17),
        Day(day: "Fri", isRaining: false, high: 23, low: 19),
        Day(day: "Sat", isRaining: false, high: 24, low: 19),
        Day(day: "Sun", isRaining: false, high: 24, low: 20)
    ]
    
    var weatherData: WeatherData {
        WeatherData(days: days)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(days, id: \.day) { day in
                        DayForecast(day: day.day, isRaining: day.isRaining, high: day.high, low: day.low)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Average High: \(weatherData.averageHighAndLow.averageHigh, specifier: "%.2f")")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Text("Average Low: \(weatherData.averageHighAndLow.averageLow, specifier: "%.2f")")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRaining: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRaining {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRaining {
            return high < 22 ? .gray : .cyan
        } else {
            return high > 23 ? .orange : .yellow
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
