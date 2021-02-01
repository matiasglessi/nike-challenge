//
//  FeedViewModel.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 29/01/2021.
//

import Foundation

class FeedViewModel {
    private let albumService: AlbumService
    
    var albumSelectedAction: (Album) -> () = { _ in }

    init(albumService: AlbumService) {
        self.albumService = albumService
    }
    
    func getAlbums(completion: @escaping ([Album]) -> Void) {
        albumService.execute { (result) in
            switch result  {
            case .success(let albums):
                completion(albums)
            case .failure(let error):
                fatalError("Must implement error case!")
            }
        }
    }
    
    func albumSelected(album: Album) {
        albumSelectedAction(album)
    }
}
