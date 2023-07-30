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
                    if let items = issues.items {
                        if items.isEmpty {
                            Text("There aren't any issues.")
                                .font(.title2)
                        }
                        else {
                            IssuesView(issues: issues)
                        }
                    }
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

private struct IssuesView: View {
    var issues: IssueModel

    func getRepositoryName(item: IssueItem) -> String {
        return .init(item.repositoryurl?.split(separator: "/").last ?? "")
    }

    var body: some View {
        List(issues.items ?? [], id: \.id) { item in
            HStack(alignment: .top) {
                Image(systemName: "smallcircle.filled.circle").foregroundColor(.green)
                Spacer().frame(width: 16)
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(item.user?.login ?? "")/\(getRepositoryName(item: item))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer().frame(height: 5)
                        Text(item.title ?? "")
                        if let labels = item.labels {
                            HStack {
                                ForEach(labels, id: \.id) { label in
                                    let bgColor = label.color != nil ? Color(hex: label.color!) : Color.gray.opacity(0.2)
                                    Text(label.name ?? "")
                                        .font(.caption)
                                        .padding(6)
                                        .background(bgColor)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    Spacer()
                    Text(item.updatedAt?.getUpdatedDate() ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }.listStyle(.inset)
    }
}
