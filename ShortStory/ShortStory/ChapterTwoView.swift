import SwiftUI

struct ChapterTwoView: View {
    var body: some View {
        VStack {
            Text("Bölüm - 2")
                .font(.headline)
                .fontDesign(.monospaced)
                .padding(.bottom)
            
            Text(
                """
                    Yansımanın içinden bir ses yükseldi: "Ben, başka bir zamanın Aria'sıyım. Yardımına ihtiyacım var."

                    Aria şaşkınlıkla geriye çekildi, ama yansıma devam etti: "Senin dünyan, bu yansımaların yalnızca geleceği gösterdiğine inanıyor. Fakat biz, başka bir paralel evrendeyiz. Bu geçitler yalnızca geleceğe değil, evrenlerin sınırlarına da açılıyor. Bizim evrenimiz çöküşün eşiğinde. Yardım edebilir misin?"

                    Aria'nın zihni, bu imkansız gibi görünen durumu kavramakta zorlanıyordu. Eğer bu doğruysa, yansıma projeleri düşündüğünden çok daha fazlasını barındırıyordu. Yansımanın tehlikelerini kimse bu kadar ileri götürmeyi düşünmemişti. Aria’nın içinde bir şüphe uyandı: Gerçekten yardım edebilir miydi? Ya bu yansıma bir tuzaksa?
                """
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ChapterTwoView()
}
