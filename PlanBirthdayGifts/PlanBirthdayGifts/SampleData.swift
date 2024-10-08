import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Gift.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for gift in Gift.sampleData {
            context.insert(gift)
        }
        
        Friend.sampleData[0].gifts.append(Gift.sampleData[0])
        Friend.sampleData[0].gifts.append(Gift.sampleData[3])
        Friend.sampleData[1].gifts.append(Gift.sampleData[0])
        Friend.sampleData[1].gifts.append(Gift.sampleData[1])
        Friend.sampleData[1].gifts.append(Gift.sampleData[3])
        Friend.sampleData[2].gifts.append(Gift.sampleData[0])
        Friend.sampleData[3].gifts.append(Gift.sampleData[2])
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var gift: Gift {
        Gift.sampleData.first!
    }
}
