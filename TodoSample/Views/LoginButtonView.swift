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
    @State var signInWithAppleDelegate: SignInWithAppleDelegate!
    
    var body: some View {
        SignInWithApple()
            .frame(width: 280, height: 60)
            .onTapGesture {
                // Create the authorization request
                let request = ASAuthorizationAppleIDProvider().createRequest()
                
                // Set scopes
                request.requestedScopes = [.fullName, .email]
                
                self.signInWithAppleDelegate = SignInWithAppleDelegate()
                
                // Setup a controller to display the authorization flow
                let controller = ASAuthorizationController(authorizationRequests: [request])
                controller.delegate = self.signInWithAppleDelegate
                
                controller.performRequests()
            }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
