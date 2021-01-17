//
//  CreateTopicRequest.swift
//  Eh-Ho
//
//  Created by Ignacio Garcia Sainz on 17/07/2019.
//  Copyright © 2019 KeepCoding. All rights reserved.
//

import Foundation

// TODO: Implementar las propiedades de esta request
struct CreateTopicRequest: APIRequest {
    
    typealias Response = AddNewTopicResponse
    
    let title: String
    let raw: String
    let createdAt: String
    
    init(title: String,
         raw: String,
         createdAt: String) {
        self.title = title
        self.raw = raw
        self.createdAt = createdAt
    }
    
    var method: Method {
        fatalError("Need to implement this")
    }
    
    var path: String {
        fatalError("Need to implement this")
    }
    
    var parameters: [String : String] {
        fatalError("Need to implement this")
    }
    
    var body: [String : Any] {
        fatalError("Need to implement this")
    }
    
    var headers: [String : String] {
        fatalError("Need to implement this")
    }
}
