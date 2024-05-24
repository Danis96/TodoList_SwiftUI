//
//  ListItemView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct ListItemView: View {
    
    let title: String
    
    var body: some View {
        HStack(content: {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        })
    }
}


#Preview {
    ListItemView(title: "First")
}
