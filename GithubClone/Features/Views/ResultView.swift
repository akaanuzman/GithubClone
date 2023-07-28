//
//  ResultView.swift
//  GithubClone
//
//  Created by Kaan Uzman on 28/7/23.
//

import SwiftUI

struct ResultView: View {
    let searchType: SearchEnum
    let searchText: String
    @StateObject var searchViewModel: SearchViewModel

    init(searchType: SearchEnum, searchText: String) {
        self.searchType = searchType
        self.searchText = searchText
        _searchViewModel = StateObject(wrappedValue: SearchViewModel(searchType: searchType, endpoint: searchText))
    }

    var body: some View {
        NavigationView {
            switch searchType {
            case .issues:
                if let issues = searchViewModel.issues {
                    List(issues.items ?? [], id: \.id) { item in
                        Text(item.title ?? "")
                    }.listStyle(.inset)
                }
                else {
                    ProgressView()
                }
            case .repositories:
                if let repositories = searchViewModel.repositories {
                    List(repositories.items ?? [], id: \.id) { item in
                        Text(item.description ?? "")
                    }.listStyle(.inset)
                }
                else {
                    ProgressView()
                }
            case .users:
                if let users = searchViewModel.users {
                    if let items = users.items {
                        if items.isEmpty {
                            Text("There aren't any users.")
                                .font(.title2)
                        }
                        else {
                            List(users.items ?? [], id: \.id) { item in
                                Text(item.login ?? "")
                            }.listStyle(.inset)
                        }
                    }
                }
                else {
                    ProgressView()
                }
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(searchType.description)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(searchType: .issues, searchText: "flutter")
    }
}
