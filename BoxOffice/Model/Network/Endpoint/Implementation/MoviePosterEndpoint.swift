//
//  MoviePosterEndpoint.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/16.
//

import Foundation

struct MoviePosterEndpoint: RequestResponseProtocol {

    typealias Response = MoviePosterDTO

    var scheme: String
    var host: String
    var path: String?
    var query: [URLQueryItem]?
    var headers: [String: String]?

    init(movieName: String) {
        self.scheme = DaumAPI.scheme
        self.host = DaumAPI.host
        self.path = DaumAPI.path
        self.query = DaumAPI.makeQuery(with: movieName)
        self.headers = ["Authorization": "KakaoAK \(DaumAPI.apiKey)"]
    }
}
