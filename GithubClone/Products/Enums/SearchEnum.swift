//
//  SearchEnum.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import Foundation

enum SearchEnum {
    case repositories
    case issues
    case users

    var description: String {
        switch self {
        case .repositories:
            return "Repositories"
        case .issues:
            return "Issues"
        case .users:
            return "Users"
        }
    }
}
