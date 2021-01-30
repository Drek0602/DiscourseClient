//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

protocol UserDetailCoordinatorDelegate: class {
    func userDetailBackButtonTapped()
}

protocol UserDetailViewDelegate: class {
    func userDetailFetched()
    func errorFetchingUserDetail()
    func errorModifiyingUserDetail()
    func successModifiyingUserDetail()
}

class UserDetailViewModel {

    var labelUserIDText: String?
    var labelUserNameText: String?
    var labelNameText: String?
    var userNameUsingTextFieldStackViewIsHidden = true
    var updateNameButtonIsHidden = true
    
    weak var viewDelegate: UserDetailViewDelegate?
    weak var coordinatorDelegate: UserDetailCoordinatorDelegate?
    let userDetailDataManager: UserDetailDataManager
    
    let username: String
    
    init(username: String, userDetailDataManager: UserDetailDataManager) {
        self.username = username
        self.userDetailDataManager = userDetailDataManager
    }
    
    func viewDidLoad() {
        
        userDetailDataManager.fetchUser(username: username) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let userResp):
                guard let user = userResp?.user else { return }
                
                self.labelUserIDText = "\(user.id)"
                self.labelUserNameText = "\(user.username)"
                self.labelNameText = "\(user.name)"
                
                if user.canEditName {
                    self.userNameUsingTextFieldStackViewIsHidden = false
                    self.updateNameButtonIsHidden = false
                } else {
                    self.userNameUsingTextFieldStackViewIsHidden = true
                    self.updateNameButtonIsHidden = true
                }
                
                self.viewDelegate?.userDetailFetched()
                
            case .failure(let error):
                print(error)
                self.viewDelegate?.errorFetchingUserDetail()
                
            }
            
        }
        
    }
    
    func updateNameButtonTapped(name: String) {
        userDetailDataManager.updateName(username: username, name: name) { [weak self] result in
            switch result {
                case .success:
                    self?.viewDelegate?.successModifiyingUserDetail()
                case.failure(let error):
                    print(error)
                    self?.viewDelegate?.errorModifiyingUserDetail()
            }
        }
    }
   
    
    func backButtonTapped() {
        coordinatorDelegate?.userDetailBackButtonTapped()
    
    }

}
