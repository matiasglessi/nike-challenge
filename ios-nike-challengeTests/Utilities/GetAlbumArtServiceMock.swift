//
//  GetAlbumArtServiceMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit
@testable import ios_nike_challenge

class GetAlbumArtServiceMock: GetAlbumArtService {
    private var isServiceCalled = false
    private let albumArt = UIImage(systemName: "x.square.fill")
    
    func execute(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void) {
        isServiceCalled = true
        completion(albumArt)
    }

    func isCalled() -> Bool {
        return isServiceCalled
    }
}
