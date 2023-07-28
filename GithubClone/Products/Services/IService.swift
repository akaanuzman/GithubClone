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
    func fetchDatas<T: Decodable>(endpoint: String) async -> T? {
        let url = "\(AppConstants.baseUrl)\(endpoint)"
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
