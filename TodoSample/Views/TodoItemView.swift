//
//  TodoItemView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    @Binding var todo: Todo
    
    var body: some View {
        HStack {
            Button(action: {
                self.todo.completed.toggle()
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
            Text(todo.body)
            Spacer()
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(todo: .constant(Todo(body: "Buy new cat toy", completed: false, id: 0)))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
