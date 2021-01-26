//
//  UpdateUserNameRequest.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 26/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UpdateUserNameRequest: APIRequest {
    
    typealias Response = UpdateUserNameResponse
    
    let username: String
    let name: String
    
    var method: Method {
        return .PUT
    }
    
    
    var path: String {
        return "/users/\(username)"
    }
    
    
    var parameters: [String : String] {
        return [:]
    }
    
    
    var body: [String : Any] {
        return ["name": name]
    }
    
    
    var headers: [String : String] {
        return [:]
    }

    
}
