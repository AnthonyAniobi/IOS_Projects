//
//  ItemModel.swift
//  TodoList
//
//  Created by Anthony Aniobi on 21/01/2026.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
