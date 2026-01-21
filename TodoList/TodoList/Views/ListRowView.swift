//
//  ListRowView.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red )
            Text(item.title)
            Spacer()
        }
    }
}


#Preview (traits: .sizeThatFitsLayout) {
    Group{
        ListRowView(item: ItemModel(title: "First item", isCompleted: false))
        ListRowView(item: ItemModel(title: "Second item", isCompleted: true))
    }
}
