//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

protocol UserCellViewModelDelegate: class {
    func userAvatarImageFetched()
}

class UserCellViewModel {
    
    weak var viewDelegate: UserCellViewModelDelegate?
    static let imageSize = 100
    let user: User
    var userNameLabelText: String?
    var nameLabelText: String?
    var avatarImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.userNameLabelText = user.username
        self.nameLabelText = user.name
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let imageStringURL = user.avatarTemplate.replacingOccurrences(of: "{size}", with: "\(UserCellViewModel.imageSize)")
            if let imageURL = URL(string: "\(apiURL)\(imageStringURL)"), let data = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: data)
                self?.avatarImage = image
                
                DispatchQueue.main.async {
                    self?.viewDelegate?.userAvatarImageFetched()
                    
                }
                
            }
            
        }
    }
}
