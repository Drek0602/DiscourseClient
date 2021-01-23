//
//  UserResponse.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let directoryItems: [DirectoryItem]
    let totalRowsDirectoryItems: Int
    let loadMoreDirectoryItems: String

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
        case totalRowsDirectoryItems = "total_rows_directory_items"
        case loadMoreDirectoryItems = "load_more_directory_items"
    }
}

// MARK: - DirectoryItem
struct DirectoryItem: Codable {
    let id, likesReceived, likesGiven, topicsEntered: Int
    let topicCount, postCount, postsRead, daysVisited: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case likesReceived = "likes_received"
        case likesGiven = "likes_given"
        case topicsEntered = "topics_entered"
        case topicCount = "topic_count"
        case postCount = "post_count"
        case postsRead = "posts_read"
        case daysVisited = "days_visited"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username: String
    let name: String?
    let avatarTemplate: String
    let title: String?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case avatarTemplate = "avatar_template"
        case title
    }
}

