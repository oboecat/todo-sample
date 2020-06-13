//
//  TodoListView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI
import Combine

struct TodoListView: View {
    @Environment(\.todosInteractor) var interactor: TodoInteractor
    @EnvironmentObject var store: AppState
    @State private var cancelBag = Set<AnyCancellable>()
    
    var body: some View {
//        Section(header: TodoListTitleView(), footer: HeaderView()) {
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack {
//                    if self.store.todos.count > 0 {
//                        ForEach(self.store.todos, id: \.id) { todo in
//                            TodoItemView(todo: todo)
//                        }
//
//                        NewTodoItemView()
//                    }
//                    Spacer()
//                }
//            }
//        }
        VStack(alignment: .leading) {
            TodoListTitleView()
            if self.store.todos.count > 0 {
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(self.store.todos, id: \.id) { todo in
                        TodoItemView(todo: todo)
                    }
                    NewTodoItemView()
                }
            } else {
                Spacer()
            }
            HeaderView()
        }
        .padding()
        .onAppear {
            self.interactor.pollTodos()
                .store(in: &self.cancelBag)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
