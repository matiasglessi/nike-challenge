//
//  AlbumServiceDefault.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

class AlbumServiceDefault: AlbumService {
    func execute(completion: @escaping (Result<[Album]>) -> Void) {
        completion(.success([]))
    }
}
