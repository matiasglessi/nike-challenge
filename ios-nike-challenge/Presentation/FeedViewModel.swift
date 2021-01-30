//
//  FeedViewModel.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import Foundation

class FeedViewModel {
    private let albumService: AlbumService
    
    init(albumService: AlbumService) {
        self.albumService = albumService
    }
    
    func getAlbums(completion: @escaping (Result<[Album]>) -> Void) {
        albumService.execute(completion: completion)
    }
}
