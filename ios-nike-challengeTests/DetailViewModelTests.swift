//
//  DetailViewModelTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 01/02/2021.
//

import XCTest
@testable import ios_nike_challenge

class DetailViewModelTests: XCTestCase {

    private let getAlbumArtService = GetAlbumArtServiceMock()
    private let albumMother = AlbumMother()
    
    func test_onGetAlbums_callsAlbumService() {
        
        let detailViewModel = DetailViewModel(getAlbumArt: getAlbumArtService, album: albumMother.get())
        
        detailViewModel.getAlbumArt(for: "http://album-art-fake-url.com") { [weak self] (albumArt) in
            guard let strongSelf = self else { return }
            XCTAssert(strongSelf.getAlbumArtService.isCalled())
        }
    }
}
