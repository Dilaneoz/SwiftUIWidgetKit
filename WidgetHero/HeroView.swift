//
//  HeroView.swift
//  WidgetHero
//
//  Created by Atil Samancioglu on 10.08.2020.
//

import SwiftUI

// burada sağda file inspector-target membership ten hero-widget extension ı seçmek gerek

struct HeroView: View {
    
    let hero : Superhero // hangi süperkahraman olduğunu istememiz gerekiyor ki o süperkahramanın detaylarını gösterelim
    var body: some View {
        
        HStack { // görsel ve text yanyana
            CircularImageView(image: Image(hero.image)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center).padding() // padding görseli biraz sağa aldı çerçeve genişleyince
            
            Spacer() // görselle text arasına mesafe koyar
         
            VStack{
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                Text(hero.realName).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

            }.padding()
            Spacer() // text i biraz sola alır
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) // HStack e frame vererek bütün ekrana yayılacağını söylüyoruz ki diğer süperkahramanların ismi uzun olursa farklı görünümler yaşanmasın. güncel ekran ne kadarsa HStack o kadar olsa iyi oluyor
            
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: batman)
    }
}
