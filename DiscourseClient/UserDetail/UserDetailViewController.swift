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
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //if canEdit = true, use this
    lazy var labelEditName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        return textField
        
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
    
    lazy var nameStackView: UIStackView = {
        let labelNameTitle = UILabel()
        labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
        labelNameTitle.text = NSLocalizedString("Name: ", comment: "")
        
        let nameStackView = UIStackView(arrangedSubviews: [labelNameTitle, labelName])
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .horizontal
        
        return nameStackView
        
    }()
    
    //use this if canEdit= true
    lazy var nameEditStackView: UIStackView = {
        let labelEditNameTitle = UILabel()
        labelEditNameTitle.translatesAutoresizingMaskIntoConstraints = false
        labelEditNameTitle.text = NSLocalizedString("Name: ", comment: "")
        
        let editNameStackView = UIStackView(arrangedSubviews: [labelEditNameTitle, labelEditName])
        editNameStackView.translatesAutoresizingMaskIntoConstraints = false
        editNameStackView.axis = .horizontal
        
        return editNameStackView
    }()
    
    lazy var labelOrTextFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameEditStackView, nameStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
        
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
        
        view.addSubview(labelOrTextFieldStackView)
        NSLayoutConstraint.activate([
            labelOrTextFieldStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            labelOrTextFieldStackView.topAnchor.constraint(equalTo: userNameStackView.bottomAnchor, constant: 8)
        ])
        
        view.addSubview(userUpdateButton)
        NSLayoutConstraint.activate([
            userUpdateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userUpdateButton.topAnchor.constraint(equalTo: labelOrTextFieldStackView.bottomAnchor, constant: 8)
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
    
    @objc func updateNameButtonClicked() {
        guard let name = labelEditName.text, !name.isEmpty else { return }
        viewModel.updateNameButtonTapped(name: name)
    
    }
    
    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func showSuccessModifiyingUserName() {
        let alertMessage: String = NSLocalizedString("Success, username updated", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func showErrorModifiyingUserName(){
        let alertMessage: String = NSLocalizedString("Error, username could not be mofidied", comment: "")
        showAlert(alertMessage)
    }
    
    
    fileprivate func updateUI() {
        UIView.animate(withDuration: 0.20) { [weak self] in
            guard let self = self else {return}
            self.labelID.text = self.viewModel.labelUserIDText
            self.labelUserName.text = self.viewModel.labelUserNameText
            self.labelName.text = self.viewModel.labelNameText
            
            //check if editable or not
            self.nameStackView.isHidden = !self.viewModel.userNameUsingTextFieldStackViewIsHidden
            
            self.nameEditStackView.isHidden = self.viewModel.userNameUsingTextFieldStackViewIsHidden
            
            self.userUpdateButton.isHidden = self.viewModel.updateNameButtonIsHidden
            
        }
        
        
        
    }
    
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userDetailFetched() {
        updateUI()
    }
    
    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
    
    func errorModifiyingUserDetail() {
     showErrorModifiyingUserName()
        
    }
    
    func successModifiyingUserDetail() {
        showSuccessModifiyingUserName()
    }
    
    
    
    
}
