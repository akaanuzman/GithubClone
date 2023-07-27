//
//  SearchField.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import SwiftUI

struct SearchField: View {
    var text: Binding<String>
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search Github", text: text)

        }.padding()
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
    }
}
