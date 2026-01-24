//
//  ContentView.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 17/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea(edges: .all)
            
            VStack (spacing: 40){
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text ("Red Color")
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
