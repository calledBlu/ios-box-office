//
//  Requestable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/01.
//

import Foundation

// EndPoint로 Server에 요청을 보낼 수 있는 타입
protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    // HTTP headers, request bodies, url parameters 등이 없는 경우에도 request 구성이 가능하다.
    var task: HTTPTask? { get }
    var headers: [String: String]? { get }
}
