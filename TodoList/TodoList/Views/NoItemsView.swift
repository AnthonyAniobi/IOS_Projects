//
//  NoItemsView.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? .red.opacity(0.7) : .accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50 : 30
                
                )
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard animate == false else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("Title")
    }
}
