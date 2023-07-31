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
            case .repositories:
                if let repositories = searchViewModel.repositories, let items = repositories.items {
                    if items.isEmpty {
                        Text("There aren't any repositories.")
                            .font(.title2)
                    }
                    else {
                        RepositoriesView(repositories: items)
                    }
                }
                else {
                    ProgressView()
                }
            case .issues:
                if let issues = searchViewModel.issues, let items = issues.items {
                    if items.isEmpty {
                        Text("There aren't any issues.")
                            .font(.title2)
                    }
                    else {
                        IssuesView(issues: items)
                    }
                }
                else {
                    ProgressView()
                }

            case .users:
                if let users = searchViewModel.users, let items = users.items {
                    if items.isEmpty {
                        Text("There aren't any users.")
                            .font(.title2)
                    }
                    else {
                        UsersView(users: items)
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

// MARK: Repository list by search result

private struct RepositoriesView: View {
    var repositories: [Item]
    var body: some View {
        List(repositories, id: \.id) { item in
            VStack(alignment: .leading) {
                AvatarAndRepoOwnerSection(item: item)
                Spacer().frame(height: SpacerConstants.medium)
                // REPO NAME
                Text(item.name ?? "")
                    .font(.headline)
                Spacer().frame(height: SpacerConstants.small)
                // REPO DESCRIPTION
                Text(item.description ?? "")
                    .font(.subheadline)
                Spacer().frame(height: SpacerConstants.medium)
                StarAndProgrammingLanguageSection(item: item)
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

// MARK: REPOSITORY AVATAR AND REPO OWNER SECTION

private struct AvatarAndRepoOwnerSection: View {
    let item: Item
    var body: some View {
        HStack {
            NetworkImageView(url: item.owner?.avatarurl ?? "", size: .small)
            Text(item.owner?.login ?? "")
                .modifier(GraySubheadline())
        }
    }
}

// MARK: REPOSITORY STAR AND PROGRAMMING LANGUAGE SECTION

private struct StarAndProgrammingLanguageSection: View {
    let item: Item
    var body: some View {
        HStack {
            Image(systemName: IconEnum.starFill.rawValue)
                .foregroundColor(.yellow)
            Text("\(item.stargazersCount ?? 0)")
                .foregroundColor(.gray)
                .fontWeight(.medium)
            Spacer().frame(width: SpacerConstants.medium)
            Image(systemName: IconEnum.circleFill.rawValue)
                .foregroundColor(Color.random())
            Text(item.language ?? "")
                .foregroundColor(.gray)
                .fontWeight(.medium)
        }
    }
}

// MARK: Issues list by search result

private struct IssuesView: View {
    var issues: [IssueItem]

    func getRepositoryName(item: IssueItem) -> String {
        return .init(item.repositoryurl?.split(separator: "/").last ?? "")
    }

    var body: some View {
        List(issues, id: \.id) {
            issue in
            HStack(alignment: .top) {
                Image(systemName: IconEnum.smallCircleFilledCircle.rawValue)
                    .foregroundColor(.green)
                    .font(.title2)
                Spacer().frame(width: SpacerConstants.large)
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(issue.user?.login ?? "")/\(getRepositoryName(item: issue))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer().frame(height: SpacerConstants.small)
                        Text(issue.title ?? "")
                        if let labels = issue.labels {
                            IssueLabelSection(labels: labels)
                        }
                    }
                    Spacer()
                    Text(issue.updatedAt?.getUpdatedDate() ?? "")
                        .modifier(GraySubheadline())
                }
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

// MARK: Issue's owned labels

private struct IssueLabelSection: View {
    let labels: [Label]

    var body: some View {
        HStack {
            ForEach(labels, id: \.id) { label in
                let bgColor = label.color != nil ? Color(hex: label.color!) : Color.gray.opacity(0.2)
                Text(label.name ?? "")
                    .modifier(LabelModifier(bgColor: bgColor))
            }
        }
    }
}

// MARK: Users list by search result

private struct UsersView: View {
    var users: [UserItem]
    var body: some View {
        List(users, id: \.id) { item in
            HStack {
                UserPpAndUsernameSection(item: item)
                Spacer()
                Image(systemName: IconEnum.chevronRight.rawValue)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 5)
        }
        .listStyle(.inset)
    }
}

// MARK: USER PP AND USERNAME

private struct UserPpAndUsernameSection: View {
    let item: UserItem
    var body: some View {
        HStack {
            NetworkImageView(url: item.avatarurl ?? "", size: .medium)
            Spacer().frame(width: SpacerConstants.large)
            Text(item.login ?? "")
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(searchType: .issues, searchText: "flutter")
    }
}
