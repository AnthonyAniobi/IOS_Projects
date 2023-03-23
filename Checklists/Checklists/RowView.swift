//
//  RowView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 21/03/2023.
//

import SwiftUI

struct RowView: View {
    
    @Binding var checklistItem: CheckListItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(
        checklistItem: $checklistItem)){
            HStack{
            Text(checklistItem.name)
            Spacer()
            Text(checklistItem.isChecked ? "✅":"🔲")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(CheckListItem(name: "preview checklist")))
    }
}
