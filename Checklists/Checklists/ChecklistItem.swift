//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Anthony Aniobi on 20/03/2023.
//

import Foundation

struct CheckListItem: Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
