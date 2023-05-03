//
//  MovieInformationEndPoint.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

struct MovieInformationEndPoint: HTTPRequestResponseProtocol {

    typealias Response = MovieInformationDTO

    var httpMethod: HTTPMethod
    var task: HTTPTask?
    var scheme: HTTPScheme
    var host: HostType
    var path: String
    var query: [URLQueryItem]?
    var headers: [String: String]?

    init(movieCode: String) {

        self.httpMethod = .get
        self.scheme = .https
        self.host = .movie
        self.path = MovieAPI.dailyBoxOffice.path
        self.query = [
            URLQueryItem(name: "key", value: Bundle.main.apiKey),
            URLQueryItem(name: "movieCd", value: movieCode)
        ]
    }
}
