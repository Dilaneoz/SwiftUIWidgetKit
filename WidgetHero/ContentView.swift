//
//  ContentView.swift
//  WidgetHero
//
//  Created by Atil Samancioglu on 10.08.2020.
//

import SwiftUI
import WidgetKit

// proje ayarlarına gidip signing&capabilities e geliyoruz ordan +capability nin artısına tıklayıp app groups u seçiyoruz. app groups süreç içerisindeki iletişimleri vs kolaylaştırmak için eklenen bir özellik. bunu yapınca bi profil oluşturur. bundle id yi kopyalıyoruz ve alttaki app groupsta artıya tıklayıp group. un yanına yapıştırıyoruz. kırmızı görünürse yenileye basıyoruz. biraz sonra ekleyeceğimiz widget ı da bu gruba dahil ederek işlemleri daha kolay yapabilir hale gelicez. aynı işlemi widgetheroextension(targets in altında) içinde de yapmak gerek

let superHeroArray = [superman,batman,ironman]

struct ContentView: View {
    // @AppStorage UserDefaults için kullanılır. aynı zamanda görünümler arasında kolaylıkla veri alıp kaydetmemizi sağlıyor. "hero" bu anahtar kelimemiz istediğimizi yazabiliriz. store kısmı nereye kaydedilceği. suiteName e yıkarıda yazdığım gibi app group un ismini veriyoruz
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.atilsamancioglu.WidgetHero"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack{
            ForEach(superHeroArray) { hero in // hero in deyince bütün superHeroArray içindeki elementler tek tek hero değişkenine atanır. for looptan bi farkı yok aslında
                
                HeroView(hero: hero).onTapGesture { // onTapGesture her bi heroya tıklanınca ne olucağını sorar. içinde count kısmı da var oraya kaç kere tıklanınca ne olucağı yazılır ama biz kullanmıyoruz
                    saveToDefaults(hero: hero) // tıklanan hero userdefaultsa kayededilir
                }
            }
        }
    }
    
    func saveToDefaults(hero : Superhero) {
        //print(hero.name)
        // veriyi JSONEncoder kullanarak veriye çevirmek gerek
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData // userdefaultsa kaydedettik
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "Hero_Widget") // save ettikten sonra widget ın kendisine biz sende değişiklik yaptık diye haber vermek gerekiyor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
