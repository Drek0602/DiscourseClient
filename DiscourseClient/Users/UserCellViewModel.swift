//
//  UserCellViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

/*protocol UserCellViewModelDelegate: class {
    func userImageFetched()
}*/

class UserCellViewModel {
    
    //weak var delegate: UserCellViewModelDelegate?
    
    static let imageSize = 100
    let user: User
    var textLabelText: String?
    //var avatarImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.textLabelText = user.username
        //downloadImage()
        
    }
    

    /*func downloadImage () {
        let replacedURL: String = user.avatarTemplate.replacingOccurrences(of: "{size}", with: "\(UserCellViewModel.imageSize)")
        
        if let imageURL = URL(string: "\(apiURL)\(replacedURL)") {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                guard let data = try? Data(contentsOf: imageURL),
                      let image = UIImage(data: data) else {return}
                
                DispatchQueue.main.async {
                    self?.avatarImage = image
                }
            }
        }
    }*/

}
