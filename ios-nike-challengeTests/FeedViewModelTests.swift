//
//  FeedViewModelTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 30/01/2021.
//

import XCTest
@testable import ios_nike_challenge
class FeedViewModelTests: XCTestCase {

    private let albumService = AlbumServiceMock()
    
    func test_onGetAlbums_callsAlbumService() {
        
        let feedViewModel = FeedViewModel(albumService: albumService)
        
        feedViewModel.getAlbums { [weak self] _ in
            guard let strongSelf = self else { return }

            XCTAssert(strongSelf.albumService.isCalled())
        }
    }
}


