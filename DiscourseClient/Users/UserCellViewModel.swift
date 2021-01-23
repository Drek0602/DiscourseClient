//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

class UserCellViewModel {
    let user: User
    var textLabelText: String?
    
    init(user: User) {
        self.user = user
        self.textLabelText = user.name
    }
    
}
