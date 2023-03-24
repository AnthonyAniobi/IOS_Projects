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
    // properties
    @State var alertIsVisible:Bool = false
    @State var sliderValue:Double = 50.0
    @State var target:Int = Int.random(in: 1...100)
    var sliderValueRounded : Int{
        Int(sliderValue.rounded())
    }
    var sliderTargetDifference: Int{
        abs(sliderValueRounded - target)
    }
    @State var score = 0
    @State var round = 1
    
    // colors
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    
    // User interface content and layout
    var body: some View {
        NavigationView {
            VStack {
                Spacer().navigationBarTitle("🎯  Bullseye  🎯")
                    HStack {
                        Text("Put the bullseye close as you can to: ").modifier(LabelStyle())
                        Text("\(target)").modifier(ValueStyle())
                    }
                    Spacer()
                    HStack{
                        Text("1").modifier(LabelStyle())
                        Slider(value: $sliderValue, in: 1...100)
                            .accentColor(.green).animation(.easeOut)
                        Text("100").modifier(LabelStyle())
                    }
                    Spacer()
                    Button(action: {
                        alertIsVisible = true
                    }){
                        Text("Hit me").font(.custom("Arial Rounded MT Bold", size: 18)).foregroundColor(.black)
                    }.alert(isPresented: $alertIsVisible){
                        Alert(
                            title: Text(alertTitle()
                                         
                            ), message: Text(scoringMessage()), dismissButton: .default(Text("Awesome")){
                            startNewRound()
                        })
                    }.background(Image("Button"))
                        .modifier(Shadow())
                    Spacer()
                    HStack {
                        Button(action: {
                            startNewGame()
                        }) {
                            HStack {
                                Image("StartOverIcon")
                                Text("Start over").modifier(ButtonSmallTextStyle())
                            }
                        }.background(Image("Button"))
                            .modifier(Shadow())
                        Spacer()
                        Text("Score:").modifier(LabelStyle())
                        Text("\(score)").modifier(ValueStyle())
                        Spacer()
                        Text("Round:").modifier(LabelStyle())
                        Text("\(round)").modifier(ValueStyle())
                        Spacer()
                        NavigationLink(destination: AboutView()){
                            HStack {
                                Image("InfoIcon")
                                Text("Info").modifier(ButtonBigTextStyle())
                            }
                        }.background(Image("Button"))
                            .modifier(Shadow())
                    }.padding(.bottom, 20).accentColor(midnightBlue)
                }.onAppear(){
                    startNewGame()
            }.background(Image("Background"))
        }.navigationViewStyle(.stack)
    }
    // Methods
    // ========
    func alertTitle()->String{
        let difference = sliderTargetDifference
        let title:String
        if(difference==0){
            title = "Perfect!"
        }else if (difference < 5){
            title = "You almost had it!"
        }else if(difference <= 10){
            title = "Not Bad."
        }else{
            title = "Are you even trying?"
        }
        return title
    }
    
    func pointsForCurrentRound()->Int{
        let maximumScore = 100
        let points:Int
        if(sliderTargetDifference==0){
            points = 200
        }else if(sliderTargetDifference == 1){
            points = 150
        }else{
            points = maximumScore - sliderTargetDifference
        }
        return points
    }
    
    func scoringMessage()->String{
        return "The slider's value is \(sliderValueRounded)\n"+" the target value is \(target)\n"+" you scored \(pointsForCurrentRound())"+" points for this round"
    }
    
    func startNewGame(){
        score = 0
        round = 1
        resetSliderAndTarget()
    }
    
    func startNewRound(){
        score = score + pointsForCurrentRound()
        round = round + 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget(){
        target = Int.random(in: 1...100)
        sliderValue = Double.random(in: 1...100)
    }
}

struct LabelStyle: ViewModifier{
    func body(content: Content)-> some View{
        content
            .font(.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(.white)
            .modifier(Shadow())
    }
}

struct ValueStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(.yellow)
            .modifier(Shadow())
    }
}

struct Shadow: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: .black, radius: 5, x: 2, y: 2)
    }
}

struct ButtonBigTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(.black)
    }
}

struct ButtonSmallTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(.black)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
