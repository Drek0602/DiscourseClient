//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UserDetailResponse: Codable {
        let user: User
    
    init(from decoder: Decoder) throws {
        let rootObject = try decoder.singleValueContainer()
        user = try rootObject.decode(User.self)
        
    }
}


