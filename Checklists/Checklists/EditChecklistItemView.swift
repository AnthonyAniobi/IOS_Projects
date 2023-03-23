//
//  EditChecklistItemView.swift
//  Checklists
//
//  Created by Anthony Aniobi on 21/03/2023.
//

import SwiftUI

struct EditChecklistItemView: View {
    @Binding var checklistItem: CheckListItem
    var body: some View {
        Form{
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(CheckListItem(name: "Preview")))
    }
}
