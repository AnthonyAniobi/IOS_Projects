//
//  ListView.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
            }else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
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
    .environmentObject(ListViewModel())
}


