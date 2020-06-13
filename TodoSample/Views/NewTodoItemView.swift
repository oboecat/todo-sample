//
//  NewTodoItemView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/27/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct NewTodoItemView: View {
    @Environment(\.todosInteractor) var interactor: TodoInteractor
    @State var bodyDraft = ""
    @State var completed = false
    
    var body: some View {
        HStack {
//            Button(action: {
//                self.completed.toggle()
//            }) {
//                if self.completed {
//                    Text("X")
//                        .foregroundColor(.green)
//                } else {
//                    Text("O")
//                        .foregroundColor(.gray)
//                }
//            }
            
            CircleToggleView(isOn: completed)
                .onTapGesture { self.completed.toggle() }
            
            
            TextField("New to-do", text: $bodyDraft, onCommit: {
                guard self.bodyDraft.count > 0 else {
                    return
                }
                let newTodo = Todo(body: self.bodyDraft, completed: self.completed, id: "null")
                self.bodyDraft = ""
                self.completed = false
                self.interactor.addNewTodo(newTodo)
            })
            .textFieldStyle(PlainTextFieldStyle())
            
            Spacer()
        }
    }
}

struct NewTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoItemView()
    }
}
