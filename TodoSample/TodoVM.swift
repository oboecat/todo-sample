//
//  TodoVM.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/26/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import Combine
import AuthenticationServices

class TodoVM: ObservableObject {
    @Published var todos: [Todo] = []
    var api = APIClient()
    private var cancellable: AnyCancellable?
    
    func start() {
        cancellable = api.getTodos()
            .receive(on: RunLoop.main)
            .assign(to: \.todos, on: self)
    }

    func getTodos() {
        cancellable = api.getTodos()
            .receive(on: RunLoop.main)
            .assign(to: \.todos, on: self)
    }
    
    func updateTodo(_ todo: Todo) {
        cancellable = api.updateTodo(todo)
            .receive(on: RunLoop.main)
            .sink { todo in
                if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
                    self.todos[index] = todo
                }
            }
    }
    
    func addNewTodo(_ todo: Todo) {
        cancellable = api.addNewTodo(todo)
            .receive(on: RunLoop.main)
            .sink { todo in
                self.todos.append(todo)
            }
    }
}
