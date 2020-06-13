//
//  Todo.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/22/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation

struct Todo: Codable, Identifiable {
    var body: String
    var completed: Bool
    var id: String
}
