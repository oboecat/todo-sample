//
//  CircleToggleView.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 6/12/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import SwiftUI

struct CircleToggleView: View {
    var isOn: Bool
    
    var body: some View {
        Group {
            if isOn {
                Circle()
                    .stroke()
                    .overlay(Circle().padding(2))
            } else {
                Circle()
//                    .foregroundColor(.back)
                    .stroke()
            }
        }
        .foregroundColor(.accentColor)
        .contentShape(Rectangle())
        .aspectRatio(contentMode: .fit)
        .frame(width: 16)
    }
}

struct CircleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleToggleView(isOn: true)
    }
}
