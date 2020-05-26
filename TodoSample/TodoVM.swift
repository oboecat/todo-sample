//
//  TodoVM.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/26/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import Combine

class TodoVM: ObservableObject {
    @Published var todos: [Todo] = []
    var api = APIClient()
    private var cancellable: AnyCancellable?
    
    func start() {
        cancellable = api.getTodos()
            .receive(on: RunLoop.main)
            .assign(to: \.todos, on: self)
    }
}
