//
//  LogoutButtonView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/11/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct LogoutButtonView: View {
    @Environment(\.userInteractor) var userInteractor: UserInteractor
    
    var body: some View {
        Button(action: {
            self.userInteractor.logout()
        }) {
            Text("Sign out")
        }
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
    }
}
