//
//  AlbumService.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

protocol AlbumService {
    func execute(completion: @escaping (Result<[Album]>) -> Void)
}
