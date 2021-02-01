//
//  DetailViewModel.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 01/02/2021.
//

class DetailViewModel {
    
    private let getAlbumArt: GetAlbumArtService
    private let album: Album
    
    init(getAlbumArt: GetAlbumArtService, album: Album) {
        self.getAlbumArt = getAlbumArt
        self.album = album
    }
    
    func getAlbumArt(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void) {
        getAlbumArt.execute(for: albumArtLink, completion: completion)
    }
    
    func getAlbum() -> Album {
        return album
    }

}
