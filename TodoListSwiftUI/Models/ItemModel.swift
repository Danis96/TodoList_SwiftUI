//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isChecked: Bool
    
    init(id: String = UUID().uuidString, title: String, isChecked: Bool) {
        self.id = id
        self.title = title
        self.isChecked = isChecked
    }
    
    // we created this completion to update the existing item, if we don't have that item we will create new id
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isChecked: !isChecked)
    }
}
