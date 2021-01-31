//
//  AlbumServiceTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 30/01/2021.
//

import XCTest
@testable import ios_nike_challenge

class AlbumServiceTests: XCTestCase {
    
    private let apiClient = APIClientMock()
    
    func test_onServiceExecutionWithSuccess_ThenReturnsSuccessfulResult() {
        apiClient.albumsResult = .success([])
        let albumService = DefaultAlbumService(apiClient: apiClient)
        albumService.execute { (result) in
            switch result {
            case .success(let albums):
                XCTAssertEqual(albums.count, 0)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    
    func test_onServiceExecutionWithRandomFailure_ThenReturnsFailurefulResult() {
        apiClient.albumsResult = .failure(getRandomFailure())
        let albumService = DefaultAlbumService(apiClient: apiClient)
        albumService.execute { (result) in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
    
    private func getRandomFailure() -> APIClientError {
        guard let error = APIClientError.allCases.randomElement() else {
            return APIClientError.invalidURL
        }
        return error
    }
    
}
