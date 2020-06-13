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

#if !os(macOS)
final class SignInWithApple: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
#endif

#if os(macOS)
final class SignInWithApple: NSViewRepresentable {
    func makeNSView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateNSView(_ nsView: ASAuthorizationAppleIDButton, context: Context) {
    }
}
#endif
