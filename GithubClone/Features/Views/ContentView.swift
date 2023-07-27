//
//  ContentView.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    @State var text: String = ""
    private var isEmpty: Bool = true
    var body: some View {
        VStack {
            if let user = userViewModel.user {
                Text(user.bio ?? "")
            }
            else {
                ProgressView()
            }
            /*SearchField(text: $text)
            Spacer()
            Text("Find your stuff.")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer().frame(height: 10)
            Text("Search all of Github for People, Repositories, Organizations, Issues, and Pull Requests.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer() */
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
