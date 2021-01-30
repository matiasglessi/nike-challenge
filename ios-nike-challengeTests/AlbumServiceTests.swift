//
//  AlbumServiceTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 30/01/2021.
//

import XCTest
@testable import ios_nike_challenge

class AlbumServiceTests: XCTestCase {
    
    func test() {
        let albumService = AlbumServiceDefault()
        albumService.execute { (result) in
            switch result {
            case .success(let albums):
                XCTAssertEqual(albums.count, 0)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    
}
