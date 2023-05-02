//
//  HTTPTask.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/01.
//

import Foundation

// 네트워크 request의 종류를 나타내는 타입
enum HTTPTask {
    case requestPlain
    // url parameters을 사용하는 request
    case requestParameters(urlParameters: [String: String])
    // request body와 url parameters을 사용하는 request
    case requestParametersAndBody(bodyParameters: String, urlParameters: [String: String])
}
