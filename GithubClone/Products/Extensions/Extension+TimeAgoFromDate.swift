//
//  Extension+TimeAgoFromDate.swift
//  GithubClone
//
//  Created by Kaan Uzman on 30/7/23.
//

import Foundation
extension Date {
    /// Example how to display seconds ago with Swift 5.1:
    /// Since iOS13 Apple introduce a new class RelativeDateTimeFormatter
    /// This class will allow you to get a time ago string based on your language. It automatically select the right unit of time based on your interval, here is an example:
    /// |-----------------------------|--------------------|
    /// | Time interval in seconds |      Display          |
    /// |-----------------------------|--------------------|
    /// |             -6                        |   6 seconds ago |
    /// |            -60                       |   1 minute ago    |
    /// |           -600                      |  10 minutes ago |
    /// |          -6000                     |    1 hour ago       |
    /// |         -60000                    |   16 hours ago    |
    /// |-----------------------------|--------------------|
    ///  Resource: https://stackoverflow.com/questions/44086555/swift-display-time-ago-from-date-nsdate
    /// - Returns: will allow you to return a time ago string based on your language. It automatically select the right unit of time based on your interval.
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
