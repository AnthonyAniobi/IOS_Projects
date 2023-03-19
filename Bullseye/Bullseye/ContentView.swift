//
//  ContentView.swift
//  Bullseye
//
//  Created by Anthony Aniobi on 18/03/2023.
//

import SwiftUI

struct ContentView: View {
    // properties
    // ..
    
    // User interface views
    @State var alertIsVisible:Bool = false
    @State var sliderValue:Double = 50.0
    @State var target:Int = Int.random(in: 1...100)
    var sliderValueRounded : Int{
        Int(sliderValue.rounded())
    }
    
    // User interface content and layout
    var body: some View {
        VStack {
            // target row
            Spacer()
            HStack {
                Text("Put the bullseye close as you can to:")
                Text("\(self.target)")
            }
            // slider row
            Spacer()
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            // Button row
            Spacer()
            Button(action: {
                print("Button pressed!!")
                self.alertIsVisible = true
            }){
                Text("Hit me")
            }.alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("Hello there!"), message: Text(self.scoringMessage()), dismissButton: .default(Text("Awesome")))
            }
            
            // score row
            // Todo add views for the score, rounds, start and info buttons here
            Spacer()
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }.padding(.bottom, 20)
        }
            
    }
    // Methods
    // ========
    func pointsForCurrentRound()->Int{
        var difference:Int
        if self.target > self.sliderValueRounded{
            difference = self.target - self.sliderValueRounded
        }else if self.target < self.sliderValueRounded{
            difference = self.sliderValueRounded - self.target
        }else{
            difference = 0
        }
        return 100 - difference
    }
    func scoringMessage()->String{
        return "The slider's value is \(self.sliderValueRounded)\n"+" you scored \(pointsForCurrentRound())"+" points for this round"
    }
    
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
#endif
