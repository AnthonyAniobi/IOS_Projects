//
//  ImageSliderView.swift
//  Furniture Ecommerce
//
//  Created by Anthony Aniobi on 29/07/2023.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["fn1", "fn2", "fn3","fn4", "fn5"]
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 180)
                    .cornerRadius(15)
            HStack{
                ForEach(0..<slides.count, id:\.self){ index in
                    Circle()
                        .fill(currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height:10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if currentIndex + 1 == slides.count{
                    currentIndex = 0
                }else{
                    currentIndex += 1
                }
            }
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
