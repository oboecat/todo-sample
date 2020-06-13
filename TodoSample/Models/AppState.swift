//
//  AppState.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/28/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import AuthenticationServices
import Auth0

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var user: UserInfo?
    @Published var todos: [Todo] = []
}
