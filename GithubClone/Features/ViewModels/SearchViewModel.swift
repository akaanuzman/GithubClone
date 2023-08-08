//
//  SearchViewModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import Foundation

class SearchViewModel: ObservableObject, IService {
    let searchType: SearchEnum
    let endpoint: String
    
    @Published var repositories: RepositoryModel?
    @Published var issues: IssueModel?
    @Published var users: UsersModel?
    
    
    init(searchType: SearchEnum, endpoint: String) {
        self.searchType = searchType
        self.endpoint = endpoint
    }
    
    
    public func fetchDatasForSearchType() async -> Void {
        switch searchType {
        case .repositories:
            repositories = await fetchDatas(endpoint: "\(Endpoints.Search.searchRepository.rawValue)\(endpoint)")
        case .issues:
            issues = await fetchDatas(endpoint: "\(Endpoints.Search.searchIssue.rawValue)\(endpoint)")
        case .users:
            users = await fetchDatas(endpoint: "\(Endpoints.Search.searchUser.rawValue)\(endpoint)")
        }
    }
}
