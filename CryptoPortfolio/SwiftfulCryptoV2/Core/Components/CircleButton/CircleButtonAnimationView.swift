//
//  CircleButtonAnimationView.swift
//  SwiftfulCryptoV2
//
//  Created by Anthony Aniobi on 24/01/2026.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.5 : 0.5)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none ,value: animate)
//            .onAppear{
//                animate.toggle()
//            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
}
