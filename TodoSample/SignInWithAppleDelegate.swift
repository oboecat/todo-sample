//
//  SignInWithAppleDelegate.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/28/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import AuthenticationServices

class SignInWithAppleDelegate: NSObject, ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("Signed in as \(appleIdCredential.email ?? "anonymous")")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization Failed: \(error)")
    }
}
