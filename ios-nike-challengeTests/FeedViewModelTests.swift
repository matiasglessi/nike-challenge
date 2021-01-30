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
        
        let sut = FeedViewModel(albumService: albumService)
        sut.getAlbums(completion: { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            XCTAssert(strongSelf.albumService.isCalled())

            switch result {
            case .success(let albums):
                XCTAssertEqual(albums.count, 1)
            case .failure(_):
                XCTFail()
            }
        })
    }
}


