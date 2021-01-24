//
//  AppCoordinator.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 01/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Coordinator principal de la app. Encapsula todas las interacciones con la Window.
/// Tiene dos hijos, el topic list, y el categories list (uno por cada tab)
class AppCoordinator: Coordinator {
    let sessionAPI = SessionAPI()

    lazy var remoteDataManager: DiscourseClientRemoteDataManager = {
        let remoteDataManager = DiscourseClientRemoteDataManagerImpl(session: sessionAPI)
        return remoteDataManager
    }()

    lazy var localDataManager: DiscourseClientLocalDataManager = {
        let localDataManager = DiscourseClientLocalDataManagerImpl()
        return localDataManager
    }()

    lazy var dataManager: DiscourseClientDataManager = {
        let dataManager = DiscourseClientDataManager(localDataManager: self.localDataManager, remoteDataManager: self.remoteDataManager)
        return dataManager
    }()

    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        let tabBarController = UITabBarController()

        let topicsNavigationController = UINavigationController()
        let topicsCoordinator = TopicsCoordinator(presenter: topicsNavigationController,
                                                  topicsDataManager: dataManager,
                                                  topicDetailDataManager: dataManager,
                                                  addTopicDataManager: dataManager)
        addChildCoordinator(topicsCoordinator)
        topicsCoordinator.start()
        
        //--------------------------------------------

        let categoriesNavigationController = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(presenter: categoriesNavigationController, categoriesDataManager: dataManager)
        
        addChildCoordinator(categoriesCoordinator)
        categoriesCoordinator.start()
        
        //------------------------------------
        
        let userNavigationController = UINavigationController()
        let userCoordinator = UserCoordinator(presenter: userNavigationController, usersDataManager: dataManager, userDetailDataManager: dataManager)
        
        addChildCoordinator(userCoordinator)
        userCoordinator.start()
        
        //-------------------------------------------

        tabBarController.tabBar.tintColor = .black

        tabBarController.viewControllers = [topicsNavigationController, categoriesNavigationController, userNavigationController]
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "list.dash")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "person.2")

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    override func finish() {}
}

