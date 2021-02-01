//
//  ImageCache.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

protocol ImageCache {
    func getImage(key: String) -> AlbumArt?
    func saveImage(key: String, image: AlbumArt?)
}
