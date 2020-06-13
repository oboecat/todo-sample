//
//  TodoListTitleView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/11/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct TodoListTitleView: View {
    var body: some View {
        Text("Todo Sample")
            .font(.system(.largeTitle, design: .rounded))
    }
}

struct TodoListTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListTitleView()
    }
}
