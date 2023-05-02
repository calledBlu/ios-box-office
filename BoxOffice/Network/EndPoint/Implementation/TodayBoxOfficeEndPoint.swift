//
//  TodayBoxOfficeEndPoint.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct TodayBoxOfficeEndPoint: RequestResponseProtocol {
    
    typealias Response = BoxOfficeDTO
    private let api = MovieAPI.todayBoxOffice
    
    var baseURL: String
    var path: String
    var httpMethod: HTTPMethod
    var task: HTTPTask?
    var headers: [String : String]?
    
    init() {
        self.baseURL = api.baseURL
        self.path = api.path
        self.httpMethod = .get
        self.task = .requestParameters(urlParameters: api.urlParameters)
    }
}
