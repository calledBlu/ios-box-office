//
//  DaumSearchImageEndpoint.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/15.
//

import Foundation

struct DaumSearchImageEndpoint: RequestResponseProtocol {
    
    typealias Response = DaumSearchImageDTO
    
    var scheme: String
    var host: String
    var path: String?
    var query: [URLQueryItem]?
    var headers: [String : String]?
    
    init(movieName: String) {
        let api = DaumAPI.movieImage(movieName)
        
        self.scheme = DaumAPI.scheme
        self.host = DaumAPI.host
        self.path = api.path
        self.query = api.query
        self.headers = api.header
    }
}
