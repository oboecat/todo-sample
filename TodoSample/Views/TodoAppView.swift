//
//  TodoAppView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/20/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI
import Auth0

struct TodoAppView: View {
    var store: AppState
    var interactor: TodoInteractor
    var userInteractor: UserInteractor
    
    init() {
        self.store = AppState()
        
        let authentication = Auth0.authentication()
        let credsManager = CredentialsManager(authentication: authentication)
        let apiClient = APIClient(credsManager: credsManager)
        
        self.interactor = TodoInteractor(store: self.store, apiClient: apiClient)
        self.userInteractor = UserInteractor(store: self.store, credsManager: credsManager)
    }
    
    var body: some View {
        RoutingView()
            .environmentObject(store)
            .environment(\.todosInteractor, interactor)
            .environment(\.userInteractor, userInteractor)
    }
}

struct TodoAppView_Previews: PreviewProvider {
    static var previews: some View {
        TodoAppView()
    }
}

struct TodosInteractorKey: EnvironmentKey {
    static var defaultValue: TodoInteractor {
        TodoInteractor(store: AppState(), apiClient: APIClient(credsManager: CredentialsManager(authentication: Auth0.authentication())))
    }
}

struct UserInteractorKey: EnvironmentKey {
    static var defaultValue: UserInteractor {
        UserInteractor(store: AppState(), credsManager: CredentialsManager(authentication: Auth0.authentication()))
    }
}

extension EnvironmentValues {
    var todosInteractor: TodoInteractor {
        get { self[TodosInteractorKey.self] }
        set { self[TodosInteractorKey.self] = newValue }
    }
    
    var userInteractor: UserInteractor {
        get { self[UserInteractorKey.self] }
        set { self[UserInteractorKey.self] = newValue }
    }
}
