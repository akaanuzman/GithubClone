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
                if isClickField {
                    HStack {
                        SearchField(text: $searchText)
                            .onTapGesture {
                                isClickField = true
                            }
                        Button("Cancel") {
                            searchText = ""
                            isClickField = false
                        }
                    }
                } else {
                    SearchField(text: $searchText)
                        .onTapGesture {
                            isClickField = true
                        }
                }
                Spacer()
                if searchText.isEmpty {
                    EmptySearchView()
                } else {
                    SearchListView(searchText: searchText)
                }
            }
            .padding()
        }
    }
}

private struct EmptySearchView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Find your stuff.")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer().frame(height: 10)
            Text("Search all of Github for People, Repositories, Organizations, Issues, and Pull Requests.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

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
