//
//  IService.swift
//  GithubClone
//
//  Created by Kaan Uzman on 27/7/23.
//

import Alamofire
import Foundation
import Logging

protocol IService {
    func fetchDatas<T: Decodable>(endpoint: String) async -> T?
}

extension IService {
    
    /// Generic GET method for in app models.
    /// If you are handle a error you can use "showError" extension.
    /// - Parameter endpoint: exp: /users, /repos
    /// - Returns: It returns the model you provided.
    func fetchDatas<T: Decodable>(endpoint: String) async -> T? {
        let url = "\(AppConstants.baseUrl)\(endpoint)"
        print(url)
        let request = AF.request(url).serializingDecodable(T.self)
        let response = await request.response
        response.error?.showError()
        return response.value
    }
}

extension AFError {
    private static let logger = Logger(label: "")

    func showError() {
        AFError.logger.error("Error Handled: \(errorDescription?.description ?? "**")")
    }
}
