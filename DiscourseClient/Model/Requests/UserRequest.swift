//
//  UserRequest.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UserRequest: APIRequest {
    
    typealias Response = UserResponse
    
    //let period
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    //https://discourse.example.com/directory_items.json?period={period}&order={order}
    //https://mdiscourse.keepcoding.io/directory_items.json?period=weekly&order=likes_received
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}

