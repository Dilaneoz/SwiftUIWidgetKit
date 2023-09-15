//
//  Superhero.swift
//  WidgetHero
//
//  Created by Atil Samancioglu on 10.08.2020.
//

import Foundation
// burada sağda file inspector-target membership ten hero-widget extension ı seçmek gerek. assets tede aynı işlemi yapmak gerekiyor
// modelimizi hazırlıyoruz
struct Superhero : Identifiable, Codable {
    
    let image : String
    let name : String
    let realName : String
    // userdefaults a veri kaydetmek istiyoruz. kaydetmek istediğimiz veri de kullanıcının hangi süperkahramanın üzerine tıkladığı verisi. bunu normal userdefaultsla da yapabiliriz aslında ama userdefaultsa ulaştırmayı çok kolaylaştıran ve gerektiğinde farklı hedefler/eklentiler arasında ulaşmayı daha da kolaylaştıran bir yöntem göstericek hoca. yeni bir widget eklediğimizde buradaki projemizden farklı bi hedef olucak. o yüzden bu hedefler arasındaki geçişi vs de öğrenicez. o sebeple structımızın Identifiable, Codable olmasını istiycez. codable olma sebebi json encoding le bunu encode edip veriye çeviricez jeson decoding le decode edip veriden superhero formatına geri çeviricez. Identifiable olma sebebi de bunun kolaylıkla for each içerisinde tableview mış gibi gösterebilmek
    var id : String {image} // codable olan her struct ın bir id bilgisine sahip olması gerek. her bir yapının bi id si olsun ki birbirinden ayrıştırabilelim. {image} bunu diyerek oluşturulan id kendi görseliyle aynı olsun diyebiliriz

}

let superman = Superhero(image: "superman", name: "Superman", realName: "Clark Kent")

let batman = Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne")

let ironman = Superhero(image: "ironman", name: "Iron Man", realName: "Tony Stark")


