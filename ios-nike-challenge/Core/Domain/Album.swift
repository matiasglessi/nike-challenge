//
//  Album.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

typealias Genre = String

struct Album: Equatable {
    let name: String
    let artist: String
    let albumArt: String
    let genres: [Genre]
    let releaseDate: String
    let copyrightInfo: String
    let itunesLink: String
}
