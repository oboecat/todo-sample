//
//  Endpoint.swift
//  iOSTodoSample
//
//  Created by Lila Pustovoyt on 5/26/20.
//  Copyright © 2020 Lila Pustovoyt. All rights reserved.
//

import Foundation
import Combine

struct Endpoint<ResponseType> where ResponseType: Decodable {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    let method: Method
    let url: URL
    let headers: [String: String]
    let body: Data?
    
    private var request: URLRequest {
        get {
            var req = URLRequest(url: url)
            req.httpMethod = method.rawValue
            req.allHTTPHeaderFields = headers
            req.httpBody = body
            
            return req
        }
    }
    
    init(method: Method, url: URL, headers: [String: String] = [String: String](), body: Data? = nil) {
        var headers = headers
        headers["Accepts"] = "application/json"
        
        self.method = method
        self.url = url
        self.headers = headers
        self.body = body
    }
    
    init<T>(method: Method, url: URL, headers: [String: String] = [String: String](), encodableBody body: T) where T: Encodable {
        var headers = headers
        headers["Content-Type"] = "application/json"
        
        let bodyJSON = try! JSONEncoder().encode(body)
        
        self.init(method: method, url: url, headers: headers, body: bodyJSON)
    }
    
    func fetch() -> AnyPublisher<ResponseType, Never> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: ResponseType.self, decoder: JSONDecoder())
            .assertNoFailure()
            .eraseToAnyPublisher()
    }
}
