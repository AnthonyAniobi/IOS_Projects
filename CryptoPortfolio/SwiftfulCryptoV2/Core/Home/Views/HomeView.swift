//
//  HomeView.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 24/01/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                HStack{
                    CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                        .animation(.none, value: showPortfolio)
//                        .padding()
                        .background(
                            CircleButtonAnimationView(animate: $showPortfolio)
//                                .frame(width: 70, height: 70)
                        )
                    Spacer()
                    Text( showPortfolio ? "Portfolio" : "Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.theme.accent)
                        .animation(.none, value: showPortfolio)
                    Spacer()
                    CircleButtonView(iconName: "chevron.right")
                        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring) {
                                showPortfolio.toggle()
                            }
                        }
                    
                }
                .padding(.horizontal)
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    HomeView()
}
