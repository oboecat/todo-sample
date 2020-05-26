//
//  APIClient.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/26/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import Combine

struct APIClient {
    let base = URL(string: "http://10.0.0.136:3000/")!
    
    func getTodos() -> AnyPublisher<[Todo], Never> {
        return Endpoint<[Todo]>(method: .get, url: base).fetch()
    }
    
    func addNewTodo(_ todo: Todo) -> AnyPublisher<Todo, Never> {
        return Endpoint<Todo>(method: .post, url: base, body: todo).fetch()
    }
    
    func updateTodo(_ todo: Todo) -> AnyPublisher<Todo, Never> {
        let updatedTodoParams = [
            "body": todo.body,
            "completed": "\(todo.completed)"
        ]
        return Endpoint<Todo>(method: .patch, url: base.appendingPathComponent("\(todo.id)"), body: updatedTodoParams).fetch()
    }
    
    func deleteTodo(_ todo: Todo) -> AnyPublisher<Todo, Never> {
        return Endpoint<Todo>(method: .delete, url: base.appendingPathComponent("\(todo.id)")).fetch()
    }
}
