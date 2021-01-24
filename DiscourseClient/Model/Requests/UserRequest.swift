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
    
    let period: Period
    let order: Order
    
    init(period: Period = .yearly, order: Order = .postCount) {
        
        self.period = period
        self.order = order
    }
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return [
            "period": period.rawValue,
            "order": order.rawValue
        ]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}

