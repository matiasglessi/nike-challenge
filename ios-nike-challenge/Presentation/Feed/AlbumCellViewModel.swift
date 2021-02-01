//
//  AlbumCellViewModel.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 31/01/2021.
//

import UIKit

typealias AlbumArt = UIImage

class AlbumCellViewModel {
    
    private let getAlbumArt: GetAlbumArtService
    
    init(getAlbumArt: GetAlbumArtService) {
        self.getAlbumArt = getAlbumArt
    }
    
    func getAlbumArt(for albumArtLink: String, completion: @escaping (AlbumArt?) -> Void) {
        getAlbumArt.execute(for: albumArtLink, completion: completion)
    }
}
