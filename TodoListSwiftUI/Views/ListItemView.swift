//
//  ListItemView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct ListItemView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack(content: {
            Image(systemName: item.isChecked ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isChecked ? .green : .red)
            Text(item.title)
            Spacer()
        })
    }
}


#Preview {
    ListItemView(item: ItemModel(title: "Second", isChecked: false))
}
