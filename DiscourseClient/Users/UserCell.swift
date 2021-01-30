//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            textLabel?.text = viewModel.userNameLabelText
            textLabel?.text = viewModel.nameLabelText
            imageView?.image = viewModel.avatarImage
        }
    }
}

extension UserCell: UserCellViewModelDelegate {
    func userAvatarImageFetched() {
        imageView?.image = viewModel?.avatarImage
        setNeedsLayout()
    }
}
