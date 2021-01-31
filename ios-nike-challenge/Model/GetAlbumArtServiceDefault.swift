//
//  GetAlbumArtServiceDefault.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

class GetAlbumArtServiceDefault: GetAlbumArtService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func execute(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void) {
        
        apiClient.download(from: URL(string: albumArtLink)) { (result) in
            
            switch result {
            
            case .success(let albumArtImage):
                completion(albumArtImage)
            case .failure(_):
                completion(UIImage(systemName: "x.square.fill"))
            }
        }
        
    }
}
