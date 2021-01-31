//
//  APIClient.swift
//  ios-nike-challenge
//
//  Created by Matias Glessi on 30/01/2021.
//

import UIKit

protocol APIClient {
    func get(from url: URL?, completion: @escaping (Result<[Album]>) -> Void)
}
