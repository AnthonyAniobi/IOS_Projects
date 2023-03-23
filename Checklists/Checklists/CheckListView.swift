//
//  ContentView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 20/03/2023.
//

import SwiftUI

struct CheckListView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(checklist.item){index in
                    RowView(checklistItem: $checklist.item[index])
                }.onDelete(perform: checklist.deleteListItem)
                    .onMove(perform: checklist.moveListItem)
                    
            }
            .navigationBarItems(
                leading: Button(action: {
                    newChecklistItemViewIsVisible = true
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add Item")
                    }
                }.sheet(isPresented: $newChecklistItemViewIsVisible){
                    NewChecklistItemView(checklist: checklist)
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist", displayMode: .inline)
                .onAppear(){
                    checklist.showChecklistContent()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
