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
import SimpleKeychain

class TodoInteractor {
    private var api: APIClient
    private unowned var store: AppState
    private var cancellable: AnyCancellable?
    
    init(store: AppState, apiClient: APIClient) {
        self.store = store
        self.api = apiClient
    }
    
    func start() {
        let timer = Timer.publish(every: 3, on: RunLoop.main, in: .common)
        cancellable = timer
            .flatMap { _ in
                
            }
//            api.getTodos()
//            .receive(on: RunLoop.main)
//            .assign(to: \.todos, on: store)
    }

    func getTodos() {
        cancellable = api.getTodos()
            .receive(on: RunLoop.main)
            .assign(to: \.todos, on: store)
    }
    
    func updateTodo(_ todo: Todo) {
        cancellable = api.updateTodo(todo)
            .receive(on: RunLoop.main)
            .sink { todo in
                if let index = self.store.todos.firstIndex(where: { $0.id == todo.id }) {
                    self.store.todos[index] = todo
                }
            }
    }
    
    func addNewTodo(_ todo: Todo) {
        cancellable = api.addNewTodo(todo)
            .receive(on: RunLoop.main)
            .sink { todo in
                self.store.todos.append(todo)
            }
    }
}
