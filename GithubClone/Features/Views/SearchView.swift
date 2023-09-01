//
//  SearchView.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var isClickField: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if searchText.isEmpty {
                    EmptySearchView()
                } else {
                    SearchListView(searchText: searchText)
                }
            }
            .padding()
        }.searchable(text: $searchText)
    }
}

// MARK: If the search field is empty, it is displayed on the screen.

private struct EmptySearchView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Find your stuff.")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer().frame(height: SpacerConstants.medium)
            Text("Search all of Github for People, Repositories, Organizations, Issues, and Pull Requests.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

// MARK: If the search field is full, it will be displayed on the screen.

private struct SearchListView: View {
    var searchText: String
    var body: some View {
        List {
            ForEach(SearchModel.searchItems) { item in
                NavigationLink(destination: ResultView(searchType: item.type, searchText: searchText)) {
                    HStack {
                        Image(systemName: item.icon)
                        Text("\(item.title) '\(searchText)'")
                    }
                    .padding(.vertical)
                }
            }
        }
        .listStyle(.inset)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
