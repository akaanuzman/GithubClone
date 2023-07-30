//
//  Extension+StringToDate.swift
//  GithubClone
//
//  Created by Kaan Uzman on 30/7/23.
//

import Foundation
extension String {
    /// It informs when it was updated by formatting the string date variable into a date object.
    /// - Returns: it returns a string that shows when it was updated.
    func getUpdatedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date(from: self)
        if let formattedDate = date {
            return formattedDate.timeAgoDisplay()
        }
        else {
            return "Please check updatedAt date"
        }
    }
}
