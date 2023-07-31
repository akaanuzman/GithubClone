//
//  GraySubheadline.swift
//  GithubClone
//
//  Created by Kaan Uzman on 31/7/23.
//

import Foundation
import SwiftUI

struct GraySubheadline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.gray)
    }
}

