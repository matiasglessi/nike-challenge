//
//  SessionMock.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import Foundation
@testable import ios_nike_challenge

class SessionMock: Session {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func loadData(from url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(data, response, error)
    }
}
