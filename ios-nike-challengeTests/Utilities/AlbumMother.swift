//
//  AlbumMother.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation
@testable import ios_nike_challenge

class AlbumMother {
    var name: String = ""
    var artist: String = ""
    var albumArt: String = ""
    var genres: [String] = [""]
    var releaseDate: String = ""
    var copyrightInfo: String = ""
    var itunesLink: String = ""

    
    func get() -> Album {
        return Album(name: name, artist: artist, albumArt: albumArt, genres: genres, releaseDate: releaseDate, copyrightInfo: copyrightInfo, itunesLink: itunesLink)
    }
    
    func withName(_ name: String) -> AlbumMother {
        self.name = name
        return self
    }
}
