//
//  ListView.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second model", isCompleted: true),
        ItemModel(title: "Third!", isCompleted: false)
    ]
    
    
    var body: some View {
        List{
            ForEach(items){ item in
//                    ListRowView(title: item)
                Text("Hi")
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
            )
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}


