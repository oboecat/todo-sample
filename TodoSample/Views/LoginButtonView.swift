//
//  LoginButtonView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/28/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct LoginButtonView: View {
    @Environment(\.userInteractor) var userInteractor: UserInteractor
    
    var body: some View {
//        SignInWithApple()
//            .frame(width: 280, height: 60)
//            .onTapGesture {
//                print("Tap")
//                self.userInteractor.login()
//            }
        Button(action: {
            print("Tap")
            self.userInteractor.login()
        }) {
            Text("Sign in with Apple")
        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
