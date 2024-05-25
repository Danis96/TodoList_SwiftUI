//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 25. 5. 2024..
//

import Foundation


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    
    init() {
       getInitialData()
    }
    
    func getInitialData() {
        let newItems: [ItemModel] = [
            ItemModel(title: "This is first item!", isChecked: false),
            ItemModel(title: "This is second!", isChecked: true),
            ItemModel(title: "Third", isChecked: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    
    func delete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func move(indexSet: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffset)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isChecked: false)
        items.append(newItem)
    }
    
    func checkItemTitleLength(title: String) -> Bool {
        if title.count < 3 {
            return false
        } else {
            return true
        }
    }
    
    func updateItem(item: ItemModel) {
        // we use $0 for the first element
        // and then we need to update that element
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
   
    
}
