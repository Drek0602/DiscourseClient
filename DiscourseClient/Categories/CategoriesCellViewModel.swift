//
//  CategoryCellViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 16/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

class CategoryCellViewModel {
    let category: Category
    var textLabelText: String?
    
    init(category: Category) {
        self.category = category
        self.textLabelText = category.name
    }
    
}

