//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is first item!", isChecked: false),
        ItemModel(title: "This is second!", isChecked: true),
        ItemModel(title: "Third", isChecked: false)
    ]
    
    var body: some View {
        List {
            ForEach(items, content: { item in
                 ListItemView(item: item)
            })
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📋")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {}, label: {
                    Text("Edit")
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}

