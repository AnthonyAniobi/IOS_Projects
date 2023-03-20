//
//  ContentView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 20/03/2023.
//

import SwiftUI

struct CheckListItem: Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ContentView: View {
    
    @State var checklistItems = [
        CheckListItem(name: "Walk the dog"),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Walk the dog", isChecked: true),
        CheckListItem(name: "Soccer practice"),
        CheckListItem(name: "Eat ice cream", isChecked: true)]
    
    let indexesToRemove = IndexSet(integersIn: 0...2)
    
    var body: some View {
        NavigationView {
            List{
                ForEach(checklistItems){item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅":"🔲")
                    }.background(.white)
                    .onTapGesture {
                        if let index = checklistItems.firstIndex(where: {$0.id == item.id}){
                            checklistItems[index].isChecked.toggle()
                            showChecklistContent()
                        }
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
