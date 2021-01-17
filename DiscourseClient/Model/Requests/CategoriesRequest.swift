//
//  CategoriesRequest.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 14/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct CategoriesRequest: APIRequest {
    
    typealias Response = CategoriesResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/categories.json"
    }
    
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

