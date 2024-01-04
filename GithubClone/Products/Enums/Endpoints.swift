//
//  Endpoints.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import Foundation
struct Endpoints {
    enum User: String {
        case user = "users/"
        case organizations = "users/orgs"
        case repositories = "users/repos"
    }

    enum Search: String {
        case searchUser = "search/users?q="
        case searchIssue = "search/issues?q="
        case searchRepository = "search/repositories?q="
    }
    
    enum TestEndpoint: String {
        case swift = "swift"
    }
}
