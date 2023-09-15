//
//  CircularImageView.swift
//  WidgetHero
//
//  Created by Atil Samancioglu on 10.08.2020.
//

import SwiftUI

// burada sağda file inspector-target membership ten hero-widget extension ı seçmek gerek

struct CircularImageView: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle()) // görsel yuvarlaklaştı
            .overlay(Circle().stroke(Color.purple,lineWidth: 5)) // overlay ile çerçeve verdik
            .shadow(radius: 15) // gölge verdik
            
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("batman"))
    }
}
