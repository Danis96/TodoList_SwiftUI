//
//  TodoListSwiftUIApp.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

@main
struct TodoListSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView ()
            }
        }
    }
}
