//
//  DefaultAlbumService.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

import UIKit

class DefaultAlbumService: AlbumService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func execute(completion: @escaping (Result<[Album]>) -> Void) {
        apiClient.get(from: URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json")) { (result) in
            completion(result)
        }
    }
}
