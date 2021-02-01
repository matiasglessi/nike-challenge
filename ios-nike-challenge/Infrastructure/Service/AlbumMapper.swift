//
//  AlbumMapper.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation

class AlbumMapper: Mapper {
    
    func jsonToAlbum(json: [String:Any]) -> Album {
        let name = getString(from: json["name"])
        let artist = getString(from: json["artistName"])
        let releaseDate = getString(from: json["releaseDate"])
        let albumArt = getString(from: json["artworkUrl100"])
        let itunesLink = getString(from: json["url"])
        let copyrightInfo = getString(from: json["copyright"])
        let genres = getGenres(from: json["genres"])
        
        
        return Album(name: name,
                     artist: artist,
                     albumArt: albumArt,
                     genres: genres,
                     releaseDate: releaseDate,
                     copyrightInfo: copyrightInfo,
                     itunesLink: itunesLink)
    }
    
    private func getString(from json: Any?) -> String {
        return json as? String ?? ""
    }
    
    private func getGenres(from json: Any?) -> [Genre] {
        
        var genres = [Genre]()
        
        guard let jsonGenresArray = json as? [[String: Any]] else { return genres }
        
        for jsonGenre in jsonGenresArray {
            genres.append(getString(from: jsonGenre["name"]))
        }
        return genres
    }
}

