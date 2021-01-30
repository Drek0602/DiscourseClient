//
//  UserCoordinator.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

///Coordinator que representa la pila de navegación del users lists

class UserCoordinator: Coordinator {
    let presenter: UINavigationController
    let usersDataManager: UserDataManager
    let userDetailDataManager: UserDetailDataManager
    var usersViewModel: UserViewModel?
    var userDetailViewModel: UserDetailViewModel?
    
    init(presenter: UINavigationController, usersDataManager: UserDataManager,
         userDetailDataManager: UserDetailDataManager) {
        
        self.presenter = presenter
        self.usersDataManager = usersDataManager
        self.userDetailDataManager = userDetailDataManager
    }
    
    override func start() {
        let usersViewModel = UserViewModel(userDataManager: usersDataManager)
        let userViewController = UserViewController(viewModel: usersViewModel)
        userViewController.title = NSLocalizedString("Users", comment: "")
        usersViewModel.viewDelegate = userViewController
        usersViewModel.coordinatorDelegate = self
        self.usersViewModel = usersViewModel
        presenter.pushViewController(userViewController, animated: false)
    }
    
    override func finish() {}
}


extension UserCoordinator: UserCoordinatorDelegate {
    func didSelect(username: String) {
        let userDetailViewModel = UserDetailViewModel(username: username, userDetailDataManager: userDetailDataManager)
        let userDetailViewController = UserDetailViewController(viewModel: userDetailViewModel)
        userDetailViewController.title = NSLocalizedString(username, comment: "")
        userDetailViewModel.viewDelegate = userDetailViewController
        userDetailViewModel.coordinatorDelegate = self
        self.userDetailViewModel = userDetailViewModel
        presenter.pushViewController(userDetailViewController, animated: false)
    }
    
}


extension UserCoordinator: UserDetailCoordinatorDelegate {
    func userDetailBackButtonTapped() {
        presenter.popViewController(animated: true)
        usersViewModel?.nameUpdated()
    }
    
}




    
