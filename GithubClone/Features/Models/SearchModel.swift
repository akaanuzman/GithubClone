//
//  SearchModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import Foundation

struct SearchModel: Identifiable {
    let id: UUID = .init()
    let icon: String
    let title: String
    let type: SearchEnum
}

extension SearchModel {
    static var searchItems: [SearchModel] = [
        SearchModel(icon: IconEnum.bookClosed.rawValue, title: "Repositories with", type: .repositories),
        SearchModel(icon: IconEnum.smallCircleFilledCircle.rawValue, title: "Issues with", type: .issues),
        SearchModel(icon: IconEnum.person.rawValue, title: "People with", type: .users)
    ]
}
