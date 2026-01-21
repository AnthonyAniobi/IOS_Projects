//
//  ItemModel.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        .init(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}
