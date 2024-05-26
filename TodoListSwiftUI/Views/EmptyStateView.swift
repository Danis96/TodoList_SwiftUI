//
//  EmptyStateView.swift
//  TodoListSwiftUI
//
//  Created by Danis Preldzic on 26. 5. 2024..
//

import SwiftUI

struct EmptyStateView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20, content: {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Are you a productive person? I think you should click the Add button and add a bunch of items to your todo list!")
                    .font(.headline)
                    .fontWeight(.light)
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add something 🥳")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("AccentColor") : Color("SecondaryColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color("AccentColor").opacity(0.7) : Color("SecondaryColor").opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
            })
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
    }
    
}

#Preview {
    NavigationStack {
        EmptyStateView()
    }
}
