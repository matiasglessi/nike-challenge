//
//  DefaultImageCache.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation

final class DefaultImageCache: ImageCache {
    static let shared = DefaultImageCache()
    
    lazy var cache = NSCache<NSString, AlbumArt>()

    func getImage(key: String) -> AlbumArt? {
        if let image = cache.object(forKey: NSString(string: key)) {
            return image
        }
        return nil
    }

    func saveImage(key: String, image: AlbumArt?) {
        
        if let image = image {
            cache.setObject(image, forKey: NSString(string: key))
        }
    }
}
