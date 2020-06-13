//
//  HeaderView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/11/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            UserView()
            Spacer()
            LogoutButtonView()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(AppState())
    }
}
