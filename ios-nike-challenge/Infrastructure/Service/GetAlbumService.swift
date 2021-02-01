//
//  GetAlbumService.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

protocol GetAlbumArtService {
    func execute(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void)
}
