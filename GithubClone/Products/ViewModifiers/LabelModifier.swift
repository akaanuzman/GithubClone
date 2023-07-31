//
//  LabelModifier.swift
//  GithubClone
//
//  Created by Kaan Uzman on 31/7/23.
//

import Foundation
import SwiftUI

struct LabelModifier: ViewModifier {
    let bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .padding(5)
            .background(bgColor)
            .cornerRadius(10)
    }
}

