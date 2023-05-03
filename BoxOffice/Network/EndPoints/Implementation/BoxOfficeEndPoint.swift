//
//  BoxOfficeEndPoint.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

struct BoxOfficeEndPoint: HTTPRequestResponseProtocol {
    
    typealias Response = BoxOfficeDTO
    
    var httpMethod: HTTPMethod
    var task: HTTPTask?
    var scheme: HTTPScheme
    var host: HostType
    var path: String
    var query: [URLQueryItem]?
    var headers: [String: String]?
    
    init(date: String) {
        
        self.httpMethod = .get
        self.scheme = .https
        self.host = .movie
        self.path = MovieAPI.dailyBoxOffice.path
        self.query = [
            URLQueryItem(name: "key", value: Bundle.main.apiKey),
            URLQueryItem(name: "targetDt", value: date)
        ]
    }
}
