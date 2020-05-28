//
//  NewTodoItemView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/27/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct NewTodoItemView: View {
    @EnvironmentObject var model: TodoVM
    @State var bodyDraft = ""
    @State var completed = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.completed.toggle()
            }) {
                if self.completed {
//                    Image(systemName: "largecircle.fill.circle")
//                        .foregroundColor(.yellow)
                    Text("X")
                        .foregroundColor(.green)
                } else {
//                    Image(systemName: "circle")
//                        .foregroundColor(.gray)
                    Text("O")
                        .foregroundColor(.gray)
                }
            }
            
            TextField("New to-do", text: $bodyDraft, onCommit: {
                let newTodo = Todo(body: self.bodyDraft, completed: self.completed, id: -1)
                self.bodyDraft = ""
                self.completed = false
                self.model.addNewTodo(newTodo)
            })
            
            Spacer()
        }
    }
}

struct NewTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoItemView()
    }
}
