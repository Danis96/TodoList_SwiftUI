//
//  AddView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 24. 5. 2024..
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismissScreen
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack(content: {
                TextField("Enter item...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    
                    if listViewModel.checkItemTitleLength(title: textFieldText) {
                        listViewModel.addItem(title: textFieldText)
                        dismissScreen.callAsFunction()
                    } else {
                        alertTitle = "Your item cannot be less than 3 characters!!! 🥸"
                        showAlert.toggle()
                    }
                    
                    
                }, label: {
                    Text("Save".uppercased())
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                })
                
            })
            .frame(maxWidth: 600)
            .padding(14)
        }.navigationTitle("Add an Item 🖊️")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationStack {
        AddView()
    }.environmentObject(ListViewModel())
}
