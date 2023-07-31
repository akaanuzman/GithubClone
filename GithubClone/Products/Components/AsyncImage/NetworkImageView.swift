//
//  NetworkImageView.swift
//  GithubClone
//
//  Created by Kaan Uzman on 31/7/23.
//

import SwiftUI

struct NetworkImageView: View {
    let url: String
    let size: NetworkImageEnum

    func getSize() -> CGFloat {
        switch size {
        case .small:
            return 25
        case .medium:
            return 50
        case .large:
            return 100
        }
    }

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getSize(), height: getSize())
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView(url: "https://picsum.photos/50/50", size: .small)
    }
}
