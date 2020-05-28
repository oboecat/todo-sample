//
//  ContentView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: TodoVM
    
    var body: some View {
        TodoListView(todos: $model.todos)
            .onAppear {
                self.model.start()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TodoVM())
    }
}
