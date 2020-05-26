//
//  TodoListView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        VStack {
            HStack {
                Text("Todos")
                    .font(.title)
                Spacer()
            }
            .padding([.horizontal, .top])
//            .pickerStyle(SegmentedPickerStyle())
            
            List {
                Picker(selection: .constant(0), label: Text("Foo")) {
                    Text("All").tag(0)
                    Text("Pending").tag(1)
                    Text("Completed").tag(2)
                }
                .padding(.horizontal)
                
                ForEach(self.todos.indices, id: \.self) { idx in
                    TodoItemView(todo: self.$todos[idx])
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todos: .constant([Todo(body: "Water plants", completed: false, id: 0)]))
    }
}
