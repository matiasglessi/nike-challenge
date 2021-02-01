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
        let album = albumMother.withName("White Album").get()
        session.data = jsonToData(with: album)

        apiClient.get(from: fakeURL) { (result) in

            switch result {
            case .success (let albums):
                XCTAssertEqual(albums, [album])
            default:
                XCTFail()
            }
        }
    }
    
    
    func test_whenSessionHasErrorAndNoData_thenMissingDataErrorIsRetrieved() {
        apiClient.get(from: fakeURL, completion: { (result) in
            switch result {
            case .failure(let error):
                
                guard let error = error as? APIClientError else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(error, self.missingDataError)
            default:
                break
            }
        })
    }
 
    func jsonToData(with album: Album) -> Data?{
        
        let json: [String : Any] = ["feed":
                                        ["results": [
                                            "name": album.name,
                                            "artistName":album.artist,
                                            "releaseDate":album.releaseDate,
                                            "copyright":album.copyrightInfo,
                                            "genres": album.genres,
                                            "url":album.itunesLink,
                                            "artworkUrl100":album.albumArt]
                                        ]
        ]
        
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            return nil
        }
    }
    
}



