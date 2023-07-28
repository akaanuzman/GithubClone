//
//  IssueModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import Foundation

// MARK: - IssueModel

struct IssueModel: Codable {
    let items: [IssueItem]?
}

// MARK: - IssueItem

struct IssueItem: Codable {
    let url: String?
    let repositoryurl: String?
    let labelsurl: String?
    let commentsurl, eventsurl, htmlurl: String?
    let id: Int?
    let nodeid: String?
    let number: Int?
    let title: String?
    let user: IssueUser?
    let labels: [Label]?
    let state: String?
    let locked: Bool?
    let assignee: IssueUser?
    let assignees: [IssueUser]?
    let milestone: String?
    let comments: Int?
    let createdAt, updatedAt: String?
    let closedAt: String?
    let authorAssociation: AuthorAssociation?
    let activeLockReason: String?
    let draft: Bool?
    let pullRequest: PullRequest?
    let body: String?
    let reactions: Reactions?
    let timelineurl: String?
    let performedViaGithubApp: String?
    let stateReason: String?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case url
        case repositoryurl = "repository_url"
        case labelsurl = "labels_url"
        case commentsurl = "comments_url"
        case eventsurl = "events_url"
        case htmlurl = "html_url"
        case id
        case nodeid = "node_id"
        case number, title, user, labels, state, locked, assignee, assignees, milestone, comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case authorAssociation = "author_association"
        case activeLockReason = "active_lock_reason"
        case draft
        case pullRequest = "pull_request"
        case body, reactions
        case timelineurl = "timeline_url"
        case performedViaGithubApp = "performed_via_github_app"
        case stateReason = "state_reason"
        case score
    }
}

// MARK: - IssueUser

struct IssueUser: Codable {
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
    }
}

enum AuthorAssociation: String, Codable {
    case collaborator = "COLLABORATOR"
    case contributor = "CONTRIBUTOR"
    case member = "MEMBER"
    case none = "NONE"
    case owner = "OWNER"
}

// MARK: - Label

struct Label: Codable {
    let id: Int?
    let nodeid: String?
    let url: String?
    let name, color: String?
    let labelDefault: Bool?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeid = "node_id"
        case url, name, color
        case labelDefault = "default"
        case description
    }
}

// MARK: - PullRequest

struct PullRequest: Codable {
    let url, htmlurl: String?
    let diffurl: String?
    let patchurl: String?
    let mergedAt: String?

    enum CodingKeys: String, CodingKey {
        case url
        case htmlurl = "html_url"
        case diffurl = "diff_url"
        case patchurl = "patch_url"
        case mergedAt = "merged_at"
    }
}

// MARK: - Reactions

struct Reactions: Codable {
    let url: String?
    let totalCount, the1, reactions1, laugh: Int?
    let hooray, confused, heart, rocket: Int?
    let eyes: Int?

    enum CodingKeys: String, CodingKey {
        case url
        case totalCount = "total_count"
        case the1 = "+1"
        case reactions1 = "-1"
        case laugh, hooray, confused, heart, rocket, eyes
    }
}
