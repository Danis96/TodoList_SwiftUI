//
//  ListView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack(content: {
            if listViewModel.items.isEmpty {
                EmptyStateView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items, content: { item in
                         ListItemView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    })
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                }
            }
        })
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
    }.environmentObject(ListViewModel())
}

