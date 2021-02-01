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
    private let imageCache = ImageCacheMock()

    private let failureAlbumArt = UIImage(systemName: "x.square.fill")
    private let successAlbumArt = UIImage(systemName: "x.circle.fill")
    
    func test_onServiceExecutionWithSuccess_ThenReturnsSuccessfulResult() {
        
        apiClient.albumArtResult = .success(successAlbumArt)
        let getAlbumArtService = getAlbumService()
        getAlbumArtService.execute(for: "", completion: { [weak self] (art) in
            guard let strongSelf = self else { return }
            
            XCTAssertEqual(art, strongSelf.successAlbumArt)
        })
    }
    
    func test_onServiceExecutionWithRandomFailure_ThenReturnsFailurefulResult() {
        apiClient.albumsResult = .failure(getRandomFailure())
        let getAlbumArtService = getAlbumService()
        getAlbumArtService.execute(for: "", completion: { [weak self] (art) in
            guard let strongSelf = self else { return }
            
            XCTAssertEqual(art, strongSelf.failureAlbumArt)
        })
    }
    
    func test_whenAskingForAnAlreadyCachedImage_thenReturnsCachedImage() {
        imageCache.saveImage(key: "123", image: successAlbumArt)
        let getAlbumArtService = getAlbumService()
        
        getAlbumArtService.execute(for: "123", completion: { [weak self] (art) in
            guard let strongSelf = self else { return }
            
            XCTAssertEqual(art, strongSelf.successAlbumArt)
        })
    }
    
    private func getAlbumService() -> GetAlbumArtService {
        return DefaultGetAlbumArtService(apiClient: apiClient, imageCache: imageCache)
    }
    
    private func getRandomFailure() -> APIClientError {
        guard let error = APIClientError.allCases.randomElement() else {
            return APIClientError.invalidURL
        }
        return error
    }
    
}
