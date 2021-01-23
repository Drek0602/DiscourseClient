//
//  UserCoordinator.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 23/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

///Coordinator que representa la pila de navegación del topics lists

class UserCoordinator: Coordinator {
    let presenter: UINavigationController
    let userDataManager: UserDataManager
    //let userDetailDataManager:
    var userViewModel: UserViewModel?
    //var userDetailViewModel:
    
    
    init(presenter: UINavigationController, userDataManager: UserDataManager) {
        self.presenter = presenter
        self.userDataManager = userDataManager
    }
    
    override func start() {
        let userViewModel = UserViewModel(userDataManager: userDataManager)
        let userViewController = UserViewController(viewModel: userViewModel)
        userViewController.title = NSLocalizedString("Users", comment: "")
        userViewModel.viewDelegate = userViewController
        
        self.userViewModel = userViewModel
        presenter.pushViewController(userViewController, animated: false)
    }
    
    override func finish() {}
    
}

