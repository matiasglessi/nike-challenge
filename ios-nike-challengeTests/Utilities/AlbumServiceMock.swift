//
//  AlbumServiceMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 30/01/2021.
//

import UIKit
@testable import ios_nike_challenge

class AlbumServiceMock: AlbumService {
    
    private var isServiceCalled = false
    private let albums = [Album(name: "White Album", artist: "The Beatles", albumArt: "http://album-art-url.com", genres: ["Rock"], releaseDate: "2020-12-10", copyrightInfo: "", itunesLink: "http://itunes-url.com")]
    
    func execute(completion: @escaping (Result<[Album]>) -> Void) {
        isServiceCalled = true
        completion(.success(albums))
    }
    
    func isCalled() -> Bool {
        return isServiceCalled
    }
}
