//
//  URLSessionAPIClientTests.swift
//  ios-nike-challengeTests
//
//  Created by Matias Glessi on 31/01/2021.
//

import XCTest
@testable import ios_nike_challenge

class URLSessionAPIClientTests: XCTestCase {

    private var apiClient: URLSessionAPIClient!
    private let session = SessionMock()
    private let mapper = AlbumMapperMock()
  
    private let fakeURL = URL(string: "http://fake.url.com")
    private let albumMother = AlbumMother()
    private let missingDataError = APIClientError.missingData
    
    override func setUp() {
        apiClient = URLSessionAPIClient(session: session, mapper: mapper)
    }
    
    func test_whenSessionHasDataAndNoError_ThenTheAlbumsAreRetrieved() {
        session.data = Data()
        mapper.album = albumMother.get()

        apiClient.get(from: fakeURL) { [weak self] (result) in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .success (let albums):
                XCTAssertEqual(albums, [strongSelf.albumMother.get()])
            default:
                break
            }
        }
    }
    
    
    func test_whenSessionHasErrorAndNoData_thenMissingDataErrorIsRetrieved() {
        apiClient.get(from: fakeURL, completion: { (result) in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error as! APIClientError, self.missingDataError)
            default:
                break
            }
        })
    }
}



