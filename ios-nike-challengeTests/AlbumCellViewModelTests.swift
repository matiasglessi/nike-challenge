//
//  AlbumCellViewModelTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import XCTest
@testable import ios_nike_challenge

class AlbumCellViewModelTests: XCTestCase {
    
    private let getAlbumArtService = GetAlbumArtServiceMock()
    
    func test_onGetAlbums_callsAlbumService() {
        
        let albumCellViewModel = AlbumCellViewModel(getAlbumArt: getAlbumArtService)
        
        albumCellViewModel.getAlbumArt(for: "http://album-art-fake-url.com") { [weak self] (albumArt) in
            guard let strongSelf = self else { return }
            XCTAssert(strongSelf.getAlbumArtService.isCalled())
        }
    }
}
