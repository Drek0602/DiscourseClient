//
//  UserDataManager.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

enum UserDataManagerError: Error {
    case unknown
}

protocol UserDataManager {
    func fetchAllUsers(completion: @escaping (Result<UserResponse?, Error>) -> ())
}
