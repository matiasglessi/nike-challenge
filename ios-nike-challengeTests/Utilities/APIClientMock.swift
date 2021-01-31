//
//  APIClientMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation
import UIKit
@testable import ios_nike_challenge

class APIClientMock: APIClient {
    
    var result: Result<[Album]> = .success([])

    func get(from url: URL?, completion: @escaping (Result<[Album]>) -> Void) {
        completion(result)
    }
}
