//
//  SignInWithApple.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/28/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
