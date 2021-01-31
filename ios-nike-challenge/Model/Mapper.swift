//
//  Mapper.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

import Foundation

protocol Mapper {
    func jsonToAlbum(json: [String:Any]) -> Album
}
