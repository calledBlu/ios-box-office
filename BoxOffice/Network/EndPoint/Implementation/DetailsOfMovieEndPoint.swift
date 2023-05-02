//
//  DetailsOfMovieEndPoint.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct DetailsOfMovieEndPoint: RequestResponseProtocol {
    
    typealias Response = DetailsOfMovieDTO
    
    var baseURL: String
    var path: String
    var httpMethod: HTTPMethod
    var task: HTTPTask?
    var headers: [String : String]?
    
    init(code: String) {
        let api = MovieAPI.detailsOfMovie
        
        self.baseURL = api.baseURL
        self.path = api.path
        self.httpMethod = .get
        
        var urlParameters = api.keyParameter
        urlParameters["movieCd"] = code
        self.task = .requestParameters(urlParameters: urlParameters)
    }
}
