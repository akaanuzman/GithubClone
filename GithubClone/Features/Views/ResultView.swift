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
                            IssuesView(issues: items)
                        }
                    }
                }
                else {
                    ProgressView()
                }
            case .repositories:
                if let repositories = searchViewModel.repositories {
                    if let items = repositories.items {
                        if items.isEmpty {
                            Text("There aren't any repositories.")
                                .font(.title2)
                        }
                        else {
                            RepositoriesView(repositories: items)
                        }
                    }
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
                            UsersView(users: items)
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

private struct IssuesView: View {
    var issues: [IssueItem]

    func getRepositoryName(item: IssueItem) -> String {
        return .init(item.repositoryurl?.split(separator: "/").last ?? "")
    }

    var body: some View {
        List(issues, id: \.id) {
            issue in
            HStack(alignment: .top) {
                Image(systemName: "smallcircle.filled.circle")
                    .foregroundColor(.green)
                    .font(.title2)
                Spacer().frame(width: 16)
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(issue.user?.login ?? "")/\(getRepositoryName(item: issue))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer().frame(height: 5)
                        Text(issue.title ?? "")
                        if let labels = issue.labels {
                            HStack {
                                ForEach(labels, id: \.id) { label in
                                    let bgColor = label.color != nil ? Color(hex: label.color!) : Color.gray.opacity(0.2)
                                    Text(label.name ?? "")
                                        .font(.caption)
                                        .padding(5)
                                        .background(bgColor)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                    Spacer()
                    Text(issue.updatedAt?.getUpdatedDate() ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

private struct RepositoriesView: View {
    var repositories: [Item]
    var body: some View {
        List(repositories, id: \.id) { item in
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: item.owner?.avatarurl ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    Text(item.owner?.login ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer().frame(height: 10)
                Text(item.name ?? "")
                    .font(.headline)
                Spacer().frame(height: 5)
                Text(item.description ?? "")
                    .font(.subheadline)
                Spacer().frame(height: 10)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(item.stargazersCount ?? 0)")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    Spacer().frame(width: 15)
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color.random())
                    Text(item.language ?? "")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                }
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

private struct UsersView: View {
    var users: [UserItem]
    var body: some View {
        List(users, id: \.id) { item in
            HStack {
                HStack {
                    AsyncImage(url: URL(string: item.avatarurl ?? "")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer().frame(width: 16)
                    Text(item.login ?? "")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(searchType: .issues, searchText: "flutter")
    }
}
