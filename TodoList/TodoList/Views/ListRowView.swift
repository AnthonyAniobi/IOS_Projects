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
            Image(systemName: "checkmark.circle")
            Text(item.title)
            Spacer()
        }
    }
}


#Preview {
    
    static var item1 = ItemModel(title: "Buy milk", isCompleted: false)
    static var item2 = ItemModel(title: "Learn SwiftUI", isCompleted: true)
    Group{
        List
    }
}
