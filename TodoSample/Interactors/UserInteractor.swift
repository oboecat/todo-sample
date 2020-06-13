//
//  UserInteractor.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/3/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import AuthenticationServices
import SimpleKeychain
import Auth0
import JWTDecode

class UserInteractor: NSObject {
    private unowned var store: AppState
    private var credsManager: CredentialsManager
    private var keychain = A0SimpleKeychain()
    
    init(store: AppState, credsManager: CredentialsManager) {
        self.store = store
        self.credsManager = credsManager
    }
    
    func login() {
        // Create the authorization request
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        // Set scopes
        request.requestedScopes = [.fullName, .email]
        
        // Setup a controller to display the authorization flow
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
    
    func logout() {
        self.store.isLoggedIn = false
        self.keychain.deleteEntry(forKey: "userId")
        self.credsManager.clear()
    }
    
    func checkSession() {
        // Try to fetch the user ID
        guard let userID = keychain.string(forKey: "userId") else {
            print("No user ID found in Keychain")
            return
        }
        
        let provider = ASAuthorizationAppleIDProvider()

        // Check the Apple credential state
        provider.getCredentialState(forUserID: userID) { state, error in
            DispatchQueue.main.async {
                switch state {
                case .authorized:
                    // Try to get credentials from the creds manager (ID token, Access Token, etc)
                    self.credsManager.credentials { error, credentials in
                        guard error == nil, let credentials = credentials else {
                            self.store.isLoggedIn = false
                            return
                        }
                        self.setUser(credentials: credentials)
                    }
                default:
                    // User is not authorized
                    self.logout()
                }
            }
        }
    }
    
    private func setUser(credentials: Credentials) {
        let jwt = try? decode(jwt: credentials.idToken!)
        self.store.user = UserInfo(json: jwt!.body)!
        self.store.isLoggedIn = true
    }
}

extension UserInteractor: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            print("Did not receive Apple credentials")
            return
        }
        
        guard let authorizationCode = appleIDCredential.authorizationCode,
            let authCode = String(data: authorizationCode, encoding: .utf8) else {
                print("Problem with the authorizationCode")
                return
        }
        
        print("\(authCode)")

        // Auth0 Token Exchange
        Auth0
            .authentication()
            .login(appleAuthorizationCode: authCode, fullName: appleIDCredential.fullName, scope: "openid profile", audience: "https://todo.example.org")
            .start { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let credentials):
                        // NEW - store the user ID in the keychain
                        self.keychain.setString(appleIDCredential.user, forKey: "userId")
                        print("Login success! \(credentials.accessToken!)")

                        // NEW - store the credentials in the credentials manager
                        self.credsManager.store(credentials: credentials)
                        self.setUser(credentials: credentials)
                        
                    case .failure(let error):
                        print("Exchange Failed: \(error)")
                        self.store.isLoggedIn = false
                    }
                }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization Failed: \(error)")
    }
}
