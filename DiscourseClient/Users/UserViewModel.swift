//
//  UserViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

/// ViewModel representando un listado de categorías
class UserViewModel {
    weak var viewDelegate: UserViewDelegate?
    let userDataManager: UserDataManager
    var userViewModels: [UserCellViewModel] = []
    
    init(userDataManager: UserDataManager) {
        self.userDataManager = userDataManager
    }
    
    
    func viewWasLoaded () {
        fetchUsers()
        
    }
    
    func fetchUsers () {
        //TODO:
    }
    
    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section: Int) -> Int {
        return userViewModels.count
    }

    func viewModel(at indexPath: IndexPath) -> UserCellViewModel? {
        guard indexPath.row < userViewModels.count else { return nil }
        return userViewModels[indexPath.row]
    }
}



    
