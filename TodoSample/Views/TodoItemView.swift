//
//  TodoItemView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    @EnvironmentObject var model: TodoVM
    @State var todoBodyDraft: String = ""
    @State var completed = false
    var todo: Todo
    
    var body: some View {
        HStack {
            Button(action: {
                var updatedTodo = self.todo
                updatedTodo.completed.toggle()
                self.model.updateTodo(updatedTodo)
            }) {
                if self.todo.completed {
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

            TextField("To-do", text: $todoBodyDraft, onCommit: {
                var updatedTodo = self.todo
                updatedTodo.body = self.todoBodyDraft
                self.model.updateTodo(updatedTodo)
            })
                .onAppear {
                    self.todoBodyDraft = self.todo.body
                }

            Spacer()
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: Todo(body: "Buy new cat toy", completed: false, id: 0))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
