//
//  NewChecklistItemView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 21/03/2023.
//

import SwiftUI

struct NewChecklistItemView: View {
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    var checklist: Checklist
    var body: some View {
        VStack{
            Text("Add a New Item")
            List {
                TextField("Enter Item name", text: $newItemName)
                Button(action:{
                    let newChecklistItem = CheckListItem(name: newItemName)
                    checklist.item.append(newChecklistItem)
                    presentationMode.wrappedValue.dismiss()
                }){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add new Item")
                    }
                }.disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
