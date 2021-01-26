//
//  UserViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserCoordinatorDelegate: class {
    //func didSelect(user: User)
    func didSelect(username: String)
}

protocol UserViewDelegate: class {
    func usersFetched()
    func errorFetchingUsers()
}

/// ViewModel representando un listado de categorías
class UserViewModel {
    weak var coordinatorDelegate: UserCoordinatorDelegate?
    weak var viewDelegate: UserViewDelegate?
    let userDataManager: UserDataManager
    var userViewModels: [UserCellViewModel] = []
    
    
    init(userDataManager: UserDataManager) {
        self.userDataManager = userDataManager
    }
    
    
    func viewWasLoaded () {
        userDataManager.fetchAllUsers { [weak self] result in
            guard let self = self else {return}
            
            switch result {
                case .success(let usersResponse):
                    guard let unWrappedUsers = usersResponse?.users  else {return}
                    self.userViewModels = unWrappedUsers.map({ user -> UserCellViewModel in
                        return UserCellViewModel(user: user)
                    })
                    
                    self.viewDelegate?.usersFetched()
                    
                case .failure(let error):
                    print(error)
                    self.viewDelegate?.errorFetchingUsers()
            }
        }
        
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
    
    func didSelectRow(at indexPath: IndexPath) {
        guard indexPath.row < userViewModels.count else { return }
        coordinatorDelegate?.didSelect(username: userViewModels[indexPath.row].user.username)
    }
}



    
