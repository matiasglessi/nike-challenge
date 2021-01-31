//
//  ImageCacheMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

@testable import ios_nike_challenge

class ImageCacheMock: ImageCache {
    private var cache: [String : AlbumArt] = [:]
    
    func getImage(key: String) -> AlbumArt? {
        return cache[key]
    }
    
    func saveImage(key: String, image: AlbumArt?) {
        cache[key] = image
    }
}
