//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 24/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    lazy var labelID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userIDStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User ID: ", comment: "")
        labelUserIDTitle.textColor = .black
        
        let userIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelID])
        userIDStackView.translatesAutoresizingMaskIntoConstraints = false
        userIDStackView.axis = .horizontal
        
        return userIDStackView
    }()
    
    lazy var userNameStackView: UIStackView = {
        let labelUsernameTitle = UILabel()
        labelUsernameTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUsernameTitle.text = NSLocalizedString("Username: ", comment: "")
       
        let usernameStackView = UIStackView(arrangedSubviews: [labelUsernameTitle, labelUserName])
        usernameStackView.translatesAutoresizingMaskIntoConstraints = false
        usernameStackView.axis = .horizontal
        
        return usernameStackView
    }()
    
    lazy var userUpdateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(updateNameButtonClicked), for: .touchUpInside)
        return button
        
    }()
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        view.addSubview(userNameStackView)
        NSLayoutConstraint.activate([
            userNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userNameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 8)
        ])
        
        view.addSubview(userUpdateButton)
        NSLayoutConstraint.activate([
            userUpdateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userUpdateButton.topAnchor.constraint(equalTo: userNameStackView.bottomAnchor, constant: 8)
        ])
        
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }
    
    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    @objc func updateNameButtonClicked() {
        
    }

    
    fileprivate func updateUI() {
        labelID.text = viewModel.labelUserIDText
        labelUserName.text = viewModel.labelUserNameText
        
    }
    
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userDetailFetched() {
        updateUI()
    }
    
    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
    
    func errorModifingUserDetail() {
        //..
    }
    
    func successModifingUserDetail() {
        //..
    }
    
    
}
