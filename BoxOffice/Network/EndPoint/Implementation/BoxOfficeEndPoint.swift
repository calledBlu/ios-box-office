//
//  TodayBoxOfficeEndPoint.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct BoxOfficeEndPoint: RequestResponseProtocol {
    
    typealias Response = BoxOfficeDTO
    
    var scheme: String
    var host: String
    var path: String
    var httpMethod: HTTPMethod
    var task: HTTPTask?
    var headers: [String : String]?
    
    init(date: String) {
        let api = MovieAPI.boxOffice
        
        self.scheme = api.scheme
        self.host = api.host
        self.path = api.path
        self.httpMethod = .get
        
        var urlParameters = api.keyParameter
        urlParameters["targetDt"] = date
        self.task = .requestParameters(urlParameters: urlParameters)
    }
}
