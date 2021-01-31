//
//  GetAlbumServiceTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import XCTest
@testable import ios_nike_challenge

class GetAlbumServiceTests: XCTestCase {
    
    private let apiClient = APIClientMock()
    let failureAlbumArt = UIImage(systemName: "x.square.fill")
    let successAlbumArt = UIImage(systemName: "x.circle.fill")
    
    func test_onServiceExecutionWithSuccess_ThenReturnsSuccessfulResult() {
        
        apiClient.albumArtResult = .success(successAlbumArt)
        let getAlbumArtService = GetAlbumArtServiceDefault(apiClient: apiClient)
        getAlbumArtService.execute(for: "", completion: { [weak self] (art) in
            
            guard let strongSelf = self else { return }
            
            XCTAssertEqual(art, strongSelf.successAlbumArt)
        })
    }
    
    
    func test_onServiceExecutionWithRandomFailure_ThenReturnsFailurefulResult() {
        apiClient.albumsResult = .failure(getRandomFailure())
        let getAlbumArtService = GetAlbumArtServiceDefault(apiClient: apiClient)
        getAlbumArtService.execute(for: "", completion: { [weak self] (art) in
            
            guard let strongSelf = self else { return }
            
            XCTAssertEqual(art, strongSelf.failureAlbumArt)
        })
    }
    
    private func getRandomFailure() -> APIClientError {
        guard let error = APIClientError.allCases.randomElement() else {
            return APIClientError.invalidURL
        }
        return error
    }
    
}
