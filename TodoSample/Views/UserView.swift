//
//  UserView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/11/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserView: View {
    @EnvironmentObject var store: AppState
    
    var body: some View {
        HStack(alignment: .center) {
            WebImage(url: store.user!.picture!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
            Text("\(store.user!.name ?? "anonymous")")
        }
        .frame(width: nil, height: 32, alignment: .leading)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
        .environmentObject(AppState())
    }
}
