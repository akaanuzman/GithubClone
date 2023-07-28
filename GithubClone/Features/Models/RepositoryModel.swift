//
//  RepositoryModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import Foundation

// MARK: - RepositoryModel
struct RepositoryModel: Codable {
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let nodeid, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let htmlurl: String?
    let description: String?
    let fork: Bool?
    let url, forksurl: String?
    let keysurl, collaboratorsurl: String?
    let teamsurl, hooksurl: String?
    let issueEventsurl: String?
    let eventsurl: String?
    let assigneesurl, branchesurl: String?
    let tagsurl: String?
    let blobsurl, gitTagsurl, gitRefsurl, treesurl: String?
    let statusesurl: String?
    let languagesurl, stargazersurl, contributorsurl, subscribersurl: String?
    let subscriptionurl: String?
    let commitsurl, gitCommitsurl, commentsurl, issueCommenturl: String?
    let contentsurl, compareurl: String?
    let mergesurl: String?
    let archiveurl: String?
    let downloadsurl: String?
    let issuesurl, pullsurl, milestonesurl, notificationsurl: String?
    let labelsurl, releasesurl: String?
    let deploymentsurl: String?
    let createdAt, updatedAt, pushedAt: String?
    let giturl, sshurl: String?
    let cloneurl: String?
    let svnurl: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: Language?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages, hasDiscussions: Bool?
    let forksCount: Int?
    let mirrorurl: String?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let allowForking, isTemplate, webCommitSignoffRequired: Bool?
    let topics: [String]?
    let visibility: Visibility?
    let forks, openIssues, watchers: Int?
    let defaultBranch: DefaultBranch?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeid = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlurl = "html_url"
        case description, fork, url
        case forksurl = "forks_url"
        case keysurl = "keys_url"
        case collaboratorsurl = "collaborators_url"
        case teamsurl = "teams_url"
        case hooksurl = "hooks_url"
        case issueEventsurl = "issue_events_url"
        case eventsurl = "events_url"
        case assigneesurl = "assignees_url"
        case branchesurl = "branches_url"
        case tagsurl = "tags_url"
        case blobsurl = "blobs_url"
        case gitTagsurl = "git_tags_url"
        case gitRefsurl = "git_refs_url"
        case treesurl = "trees_url"
        case statusesurl = "statuses_url"
        case languagesurl = "languages_url"
        case stargazersurl = "stargazers_url"
        case contributorsurl = "contributors_url"
        case subscribersurl = "subscribers_url"
        case subscriptionurl = "subscription_url"
        case commitsurl = "commits_url"
        case gitCommitsurl = "git_commits_url"
        case commentsurl = "comments_url"
        case issueCommenturl = "issue_comment_url"
        case contentsurl = "contents_url"
        case compareurl = "compare_url"
        case mergesurl = "merges_url"
        case archiveurl = "archive_url"
        case downloadsurl = "downloads_url"
        case issuesurl = "issues_url"
        case pullsurl = "pulls_url"
        case milestonesurl = "milestones_url"
        case notificationsurl = "notifications_url"
        case labelsurl = "labels_url"
        case releasesurl = "releases_url"
        case deploymentsurl = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case giturl = "git_url"
        case sshurl = "ssh_url"
        case cloneurl = "clone_url"
        case svnurl = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case mirrorurl = "mirror_url"
        case archived, disabled
        case openIssuesCount = "open_issues_count"
        case license
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics, visibility, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
}

enum DefaultBranch: String, Codable {
    case develop = "develop"
    case main = "main"
    case master = "master"
}

enum Language: String, Codable {
    case c = "C++"
    case dart = "Dart"
    case html = "HTML"
}

// MARK: - License
struct License: Codable {
    let key, name, spdxid: String?
    let url: String?
    let nodeid: String?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxid = "spdx_id"
        case url
        case nodeid = "node_id"
    }
}

// MARK: - Owner
struct Owner: Codable {
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
    let type: TypeEnum?
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

enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}

enum Visibility: String, Codable {
    case visibilityPublic = "public"
}
