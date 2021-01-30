import Foundation

// TODO: Implementar aquí el modelo de la respuesta.
// Puedes echar un vistazo en https://docs.discourse.org


// MARK: - LatestTopicsResponse
struct LatestTopicsResponse: Codable {
    let users: [User]
    let topicList: TopicList

    enum CodingKeys: String, CodingKey {
        case users
        case topicList = "topic_list"
    }
}

// MARK: - TopicList
struct TopicList: Codable {
    let canCreateTopic: Bool
    let moreTopicsURL: String
    let draftKey: String
    let perPage: Int
    let topics: [Topic]

    enum CodingKeys: String, CodingKey {
        case canCreateTopic = "can_create_topic"
        case moreTopicsURL = "more_topics_url"
        case draftKey = "draft_key"
        case perPage = "per_page"
        case topics
    }
}

// MARK: - Topic
struct Topic: Codable {
    let id: Int
    let title, fancyTitle: String?
    let postsCount, replyCount, highestPostNumber: Int
    let imageURL: String?
    let createdAt, lastPostedAt: String?
    let unseen, pinned: Bool?
    let excerpt: String?
    let visible, closed, archived: Bool?
    let liked: Bool?
    let views, likeCount: Int?
    let hasSummary: Bool?
    let lastPosterUsername: String?
    let categoryID: Int?
    let pinnedGlobally: Bool?
    

    enum CodingKeys: String, CodingKey {
        case id, title
        case fancyTitle = "fancy_title"
        case postsCount = "posts_count"
        case replyCount = "reply_count"
        case highestPostNumber = "highest_post_number"
        case imageURL = "image_url"
        case createdAt = "created_at"
        case lastPostedAt = "last_posted_at"
        case unseen, pinned, excerpt, visible, closed, archived, liked, views
        case likeCount = "like_count"
        case hasSummary = "has_summary"
        case lastPosterUsername = "last_poster_username"
        case categoryID = "category_id"
        case pinnedGlobally = "pinned_globally"
    
    }
}



