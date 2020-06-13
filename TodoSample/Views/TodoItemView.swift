//
//  TodoItemView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    @Environment(\.todosInteractor) var interactor: TodoInteractor
    @State var todoBodyDraft: String = ""
    @State var completedDraft = false
    var todo: Todo
    
    var body: some View {
        HStack {
            CircleToggleView(isOn: self.completedDraft)
                .onTapGesture {
                    print("Tippity tap")
                    var updatedTodo = self.todo
                    updatedTodo.completed.toggle()
                    self.completedDraft = updatedTodo.completed
                    
                    self.interactor.updateTodo(updatedTodo)
                }

            TextField("To-do", text: $todoBodyDraft, onEditingChanged: { editing in
                print("Editing: \(editing)")
            }, onCommit: {
                var updatedTodo = self.todo
                updatedTodo.body = self.todoBodyDraft
                self.interactor.updateTodo(updatedTodo)
            })
            .textFieldStyle(PlainTextFieldStyle())

            Spacer()
        }
        .onAppear {
            self.completedDraft = self.todo.completed
            self.todoBodyDraft = self.todo.body
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: Todo(body: "Buy new cat toy", completed: false, id: "test"))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
