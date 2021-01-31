//
//  APIClientMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation
import UIKit
@testable import ios_nike_challenge

class APIClientMock: APIClient {
    
    var albumsResult: Result<[Album]> = .success([])
    var albumArtResult: Result<AlbumArt?> = .success(UIImage(systemName: "x.square.fill"))

    func get(from url: URL?, completion: @escaping (Result<[Album]>) -> Void) {
        completion(albumsResult)
    }
    
    func download(from url: URL?, completion: @escaping (Result<AlbumArt?>) -> Void) {
        completion(albumArtResult)
    }
    
}
