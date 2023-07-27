// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userModel = try? JSONDecoder().decode(UserModel.self, from: jsonData)

import Foundation

// MARK: - UserModel

struct UserModel: Codable {
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
    let name, company, blog, location: String?
    let email, hireable, bio, twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: String?

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
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
