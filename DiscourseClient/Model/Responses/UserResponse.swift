//
//  UserResponse.swift
//  DiscourseClient
//
//  Created by Tim Acosta on 22/1/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import Foundation

struct UserResponse: Codable {
    let users: Users

    enum CodingKeys: String, CodingKey {
        case users = "directory_items"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        users = try container.decode(Users.self, forKey: .users)
    }
}

typealias Users = [User]

struct User: Codable {
    
    let id: Int
    let username: String
    let name: String
    let avatarTemplate: String
    let email: String?
    let canEdit: Bool?
    let canEditUsername: Bool?
    let canEditEmail: Bool?
    let canEditName: Bool
    let ignored: Bool?
    let muted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userKey = "user"
        
        case id, username, name, email, ignored, muted
        case avatarTemplate = "avatar_template"
        case canEdit = "can_edit"
        case canEditUsername = "can_edit_username"
        case canEditEmail = "can_edit_email"
        case canEditName = "can_edit_name"
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let rootUser = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .userKey) {
            container = rootUser
        }
        
        id = try container.decode(Int.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        avatarTemplate = try container.decode(String.self, forKey: .avatarTemplate)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? "No name"
        canEdit = try container.decodeIfPresent(Bool.self, forKey: .canEdit)
        canEditUsername = try container.decodeIfPresent(Bool.self, forKey: .canEditUsername)
        canEditEmail = try container.decodeIfPresent(Bool.self, forKey: .canEditEmail)
        canEditName = try container.decodeIfPresent(Bool.self, forKey: .canEditName) ?? false
        ignored = try container.decodeIfPresent(Bool.self, forKey: .ignored)
        muted = try container.decodeIfPresent(Bool.self, forKey: .muted)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(username, forKey: .username)
    }
}

enum Period: String {
    case daily
    case weekly
    case monthly
    case quarterly
    case yearly
    case all
    
}

enum Order: String {
    case likesReceived = "likes_received"
    case likesGiven = "likes_given"
    case topicCount = "topic_count"
    case postCount = "post_count"
    case postsRead = "posts_read"
    case daysVisited = "days_visited"
}



