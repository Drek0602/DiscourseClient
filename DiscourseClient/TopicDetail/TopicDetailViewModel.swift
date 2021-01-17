//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import Foundation

/// Delegate que usaremos para comunicar eventos relativos a navegación, al coordinator correspondiente
protocol TopicDetailCoordinatorDelegate: class {
    func topicDetailBackButtonTapped()
}

/// Delegate para comunicar a la vista cosas relacionadas con UI
protocol TopicDetailViewDelegate: class {
    func topicDetailFetched()
    func errorFetchingTopicDetail()
}

class TopicDetailViewModel {
    var labelTopicIDText: String?
    var labelTopicNameText: String?
    var postsNumbers: String?
    var possibleDeleteTopic: Bool = false

    weak var viewDelegate: TopicDetailViewDelegate?
    weak var coordinatorDelegate: TopicDetailCoordinatorDelegate?
    let topicDetailDataManager: TopicDetailDataManager
    let topicID: Int

    init(topicID: Int, topicDetailDataManager: TopicDetailDataManager) {
        self.topicID = topicID
        self.topicDetailDataManager = topicDetailDataManager
    }

    func viewDidLoad() {
        
        topicDetailDataManager.fetchTopic(id: topicID) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success (let topicResponse):
                    guard let topic = topicResponse?.topic//let details =
                            /*topicResponse?.details*/ else {return}
                    self.labelTopicIDText = "\(topic.id)"
                    self.labelTopicNameText = topic.title
                    //self.postsNumbers = "\(topic.postsCount)"
                   // self.possibleDeleteTopic = details.canDelete ?? false
                    
                    self.viewDelegate?.topicDetailFetched()
                    
                case .failure(let error):
                    print(error)
                    self.viewDelegate?.errorFetchingTopicDetail()
                    
            }
            
        }

    }

    func backButtonTapped() {
        coordinatorDelegate?.topicDetailBackButtonTapped()
    }
}
