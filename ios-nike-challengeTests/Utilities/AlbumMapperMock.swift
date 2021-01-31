//
//  AlbumMapperMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation
@testable import ios_nike_challenge

class AlbumMapperMock: Mapper {
    
    var album: Album = AlbumMother().get()
    
    func jsonToAlbum(json: [String : Any]) -> Album {
        return album
    }
}
