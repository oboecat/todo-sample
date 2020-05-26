//
//  Model.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/22/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import Combine

class Model {
    private var cancellable: AnyCancellable?
    let api = APIClient()
    
    func start() {
        cancellable = api.getTodos()
            .sink { value in
                print(value)
            }
    }
}
