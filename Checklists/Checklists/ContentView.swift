//
//  ContentView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 20/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var checklistItems = ["Walk the dog","Brush my teeth","Learn iOS development","Soccer practice","Eat ice cream"]
    
    let indexesToRemove = IndexSet(integersIn: 0...2)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(checklistItems, id: \.self){item in
                    Text(item).onTapGesture {
                        checklistItems.remove(atOffsets: indexesToRemove)
                        showChecklistContent()
                    }
                }.onDelete(perform: deleteListItem)
                    .onMove(perform: moveListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
                .onAppear(){
                    showChecklistContent()
                }
        }
    }
    
    func showChecklistContent(){
        for item in checklistItems{
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet){
        checklistItems.remove(atOffsets: whichElement)
        showChecklistContent()
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
