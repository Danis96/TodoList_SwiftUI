//
//  ListViewModel.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 25. 5. 2024..
//

import Foundation


class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        // on every change of this array of objects, this will trigger
        didSet {
            saveItemToDefaults()
        }
    }
    
    let items_key = "ITEMS_KEY"
    
    
    init() {
        getInitialData()
    }
    
    func getInitialData() {
        // check user defaults and decode the data if there is any
        guard
            let data = UserDefaults.standard.data(forKey: items_key),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        
        items.append(contentsOf: savedItems)
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
    
    func saveItemToDefaults() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: items_key)
        }
    }
    
    
}
