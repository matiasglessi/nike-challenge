//
//  DefaultGetAlbumArtService.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

class DefaultGetAlbumArtService: GetAlbumArtService {
    
    private let apiClient: APIClient
    private let imageCache: ImageCache
    
    init(apiClient: APIClient, imageCache: ImageCache = DefaultImageCache()) {
        self.apiClient = apiClient
        self.imageCache = imageCache
    }
    
    func execute(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void) {
        
        if let image = imageCache.getImage(key: albumArtLink) {
            completion(image)
        } else {
            apiClient.download(from: URL(string: albumArtLink)) { [weak self] (result) in
                
                guard let strongSelf = self else { return }
                
                switch result {
                
                case .success(let albumArtImage):
                    strongSelf.imageCache.saveImage(key: albumArtLink, image: albumArtImage)
                    completion(albumArtImage)
                case .failure(_):
                    completion(UIImage(systemName: "x.square.fill"))
                }
            }
        }
    }
}
