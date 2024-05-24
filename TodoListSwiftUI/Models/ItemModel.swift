//
//  ItemModel.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isChecked: Bool
}
