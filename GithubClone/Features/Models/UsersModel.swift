//
//  UsersModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import Foundation

// MARK: - UsersModel
struct UsersModel: Codable {
    let items: [UserItem]?
}

// MARK: - UserItem
struct UserItem: Codable {
    let login: String?
    let id: Int?
    let nodeid: String?
    let avatarurl: String?
    let gravatarid: String?
    let url, htmlurl, followersurl: String?
    let followingurl, gistsurl, starredurl: String?
    let subscriptionsurl, organizationsurl, reposurl: String?
    let eventsurl: String?
    let receivedEventsurl: String?
    let type: String?
    let siteAdmin: Bool?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeid = "node_id"
        case avatarurl = "avatar_url"
        case gravatarid = "gravatar_id"
        case url
        case htmlurl = "html_url"
        case followersurl = "followers_url"
        case followingurl = "following_url"
        case gistsurl = "gists_url"
        case starredurl = "starred_url"
        case subscriptionsurl = "subscriptions_url"
        case organizationsurl = "organizations_url"
        case reposurl = "repos_url"
        case eventsurl = "events_url"
        case receivedEventsurl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case score
    }
}

