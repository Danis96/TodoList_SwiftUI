//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is first item!",
        "This is second",
        "Third"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self, content: { item in
                ListItemView(title: item)
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

