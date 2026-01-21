//
//  AddView.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import SwiftUI

struct AddView: View {
        
    @State private var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button{
                    
                }label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
