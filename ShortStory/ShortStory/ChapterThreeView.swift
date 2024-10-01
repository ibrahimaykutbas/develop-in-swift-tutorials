import SwiftUI

struct ChapterThreeView: View {
    var body: some View {
        VStack {
            Text("Bölüm - 3")
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.bottom)
            
            Text(
                """
                    Yansımanın içindeki Aria, umutsuzca bir bakışla gözlerinin içine baktı: "Lütfen. Yok olacağız."

                    Aria, elindeki veri terminaline baktı. Protokollere aykırıydı. Müdahale etmesi, iki evren arasında dengeyi bozabilirdi. Ama yapmazsa, bu yansımanın yok olmasına göz yummak zorundaydı. Gözlerini kapadı, derin bir nefes aldı ve kararını verdi. Ellerini geçidin kenarına uzattı ve yansımanın çağrısına karşılık verdi.
                """
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ChapterThreeView()
}
