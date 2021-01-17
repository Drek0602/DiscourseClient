//
//  CategoryCell.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 16/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.textLabelText
        }
    }
    
}

