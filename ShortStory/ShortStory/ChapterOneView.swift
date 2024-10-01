import SwiftUI

struct ChapterOneView: View {
    var body: some View {
        VStack {
            Text("Bölüm - 1")
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.bottom)
            
            Text(
                """
                    Bir zamanlar, 2143 yılında, insanlık sınırları zorlayan bir keşif yapmıştı: zamanın dokusu. Bilim insanları, zamanı bükebilen ve farklı zaman dilimlerine "yansıma" adı verdikleri geçitler açabilen bir teknoloji geliştirmişti. Bu geçitler, gelecekte olacak olayların yansımasını gösteriyor, ancak hiçbir insan bu yansımalara müdahale edemiyordu.
                
                    Genç mühendis Aria, bu projede çalışan yetenekli bir bilim insanıydı. Görevi, yeni bir yansımayı incelemekti. Bir gün, laboratuvarda yalnızken karşısındaki yansımada tuhaf bir şey fark etti: Kendi yüzü ona bakıyordu, ama bu Aria'nın gelecekteki bir hali değildi. Yansıma, bir yabancıydı.
                """
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ChapterOneView()
}
