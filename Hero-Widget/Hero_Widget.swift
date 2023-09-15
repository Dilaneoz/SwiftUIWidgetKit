//
//  Hero_Widget.swift
//  Hero-Widget
//
//  Created by Atil Samancioglu on 10.08.2020.
//

import WidgetKit
import SwiftUI
import Intents

// widget eklemek için yukarıdan file-new-target diyoruz. açılan sayfa IOS sayfasında eklentileri gösterir. widget extension ı seçiyoruz ve oluşturuyoruz. 

struct Provider: IntentTimelineProvider {
    // userdefaultstan veriyi alıcaz
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.atilsamancioglu.WidgetHero"))
    var heroData : Data = Data()
    // verinin ne zaman ve ne şekil gösterileceğini ve gösterilemezse ne yapılacağını hazırlıyoruz aşağıda
    func placeholder(in context: Context) -> SimpleEntry { // widget lar anasayfada gözüktüğü için apple bunların görünümünü önemsiyor. placeholder, widget ımızda internetten bir veri çekiyorsak ve yoğun bi işlem yapıyorsak yani bikaç sn bekleyebilirse, o widget yüklenene kadar ya da yüklenememesi durumunda kullanıcıya doğru düzgün biş göstermemizi sağlar. biz herhangi bi hero göstericez
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) { // zaman içinde widgetlar değiştirilebilir. yani 9-12 arası farklı bi widget 12-3 arası farklı bi widget gibi
        if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
        
        
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) { // burada da getSnapshot tı ayarlıyoruz
        
        if let hero = try? JSONDecoder().decode(Superhero.self, from: heroData) {
            let date = Date()
            
            let entry = SimpleEntry(date: date, configuration: configuration, hero: hero)

            let timeline = Timeline(entries: [entry], policy: .never) // policy ile görsel belli bi aralıkta değişicek mi onu söylüyoruz
            completion(timeline)
        }
        
    }
}

struct SimpleEntry: TimelineEntry { // entry ler bizim göstermek istediğimiz veriler
    let date: Date
    let configuration: ConfigurationIntent
    let hero : Superhero // Superhero göstermek istiyoruz
}

struct Hero_WidgetEntryView : View { // widget ın içinde ne gösterileceğini söyler bu fonksiyon. Provider.Entry den alır bilgiyi
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image)) // entry nin içinde CircularImageView olucak
    }
}

@main
struct Hero_Widget: Widget { // widget ın kendisi. bütün yaptıklarımızı birbirine bağlıyoruz ve widget ı gösteriyoruz
    let kind: String = "Hero_Widget"

    var body: some WidgetConfiguration {
        // IntentConfiguration ın yanında bir de staticconfiguration var o da widget kullanıcı tarafından herhangi bi değişikliğe tabi tutulamayacaksa kullanabileceğimiz, IntentConfiguration ise biraz daha alengirli, kullanıcının değiştirmeye müsait olacağı ayarlarda kullanabileceğimiz bişi. burada static de kullanılabilirdi. bu struct bize hazır oluşturuluyor swift tarafından
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Hero_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Hero Widget")
        .description("Hero widget!!!!")
    }
}



 
