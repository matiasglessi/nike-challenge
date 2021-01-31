//
//  URLSessionAPIClient.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

import Foundation
import UIKit

enum APIClientError: Error, Equatable, CaseIterable {
    case missingData
    case invalidURL
    case unknown
}

class URLSessionAPIClient: APIClient {
    
    private let session: Session
    private let mapper: Mapper
    
    init(session: Session = URLSession.shared, mapper: Mapper = AlbumMapper()) {
        self.session = session
        self.mapper = mapper
    }
    
    func get(from url: URL?, completion: @escaping (Result<[Album]>) -> Void) {
        
        
        guard let url = url else {
            completion(.failure(APIClientError.invalidURL))
            return
        }
        
        
        session.loadData(from: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(APIClientError.missingData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    if let jsonData = convertedJsonIntoDict["feed"] as? [String : Any],
                       let jsonArray = jsonData["results"] as? [[String : Any]] {

                        var albums = [Album]()
                        jsonArray.forEach { (json) in
                            albums.append(self.mapper.jsonToAlbum(json:  json))
                        }
                        completion(.success(albums))
                    }
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func download(from url: URL?, completion: @escaping (Result<AlbumArt?>) -> Void) {
       
        guard let url = url else {
            completion(.failure(APIClientError.invalidURL))
            return
        }

        session.loadData(from: url) { (data, response, error) in
            guard
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                completion(.failure(APIClientError.unknown))
                return
            }
            
            completion(.success(image))
        }
    }
}
