//
//  UserViewModel.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import Foundation

class UserViewModel: ObservableObject, IService {
    @Published var user: UserModel?
    
    init(user: UserModel? = nil) {
        self.user = user
        Task.detached {
            await self.getUserInformation()
        }
    }
    
    func getUserInformation() async {
        print("\(Endpoints.User.user.rawValue)akaanuzman")
        user = await fetchDatas(endpoint: "\(Endpoints.User.user.rawValue)akaanuzman")
    }
}

