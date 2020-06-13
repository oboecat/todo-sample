//
//  RoutingView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/5/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct RoutingView: View {
    @EnvironmentObject var store: AppState
    @Environment(\.userInteractor) var userInteractor: UserInteractor
    
    var body: some View {
        Group {
            if store.isLoggedIn {
                TodoListView()
            } else {
                LoginButtonView()
            }
        }
        .onAppear {
            self.userInteractor.checkSession()
        }
    }
}

struct RoutingView_Previews: PreviewProvider {
    static var previews: some View {
        RoutingView()
    }
}
