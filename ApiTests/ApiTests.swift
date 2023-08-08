//
//  ApiTests.swift
//  ApiTests
//
//  Created by Kaan Uzman on 6/8/23.
//

import XCTest

/// ApiTests class where API requests are tested
final class ApiTests: XCTestCase {
    
    /// Unit Test Method that allows us to request the API required for repositories containing the swift keyword and understand whether it is working or not.
    func testSearchRepository() async throws {
        let searchViewModel = SearchViewModel(searchType: SearchEnum.repositories, endpoint: "swift")
        await searchViewModel.fetchDatasForSearchType()
        XCTAssertNotNil(searchViewModel.repositories)
    }
    
    /// Unit Test Method that allows us to request the API required for issues containing the swift keyword and understand whether it is working or not.
    func testSearchIssue() async throws {
        let searchViewModel = SearchViewModel(searchType: SearchEnum.issues, endpoint: "swift")
        await searchViewModel.fetchDatasForSearchType()
        XCTAssertNotNil(searchViewModel.issues)
    }
    
    /// Unit Test Method that allows us to request the API required for users containing the swift keyword and understand whether it is working or not.
    func testSearchUser() async throws {
        let searchViewModel = SearchViewModel(searchType: SearchEnum.users, endpoint: "swift")
        await searchViewModel.fetchDatasForSearchType()
        XCTAssertNotNil(searchViewModel.users)
    }
}
