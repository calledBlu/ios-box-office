//
//  NetworkResponse.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

/// 네트워크에 대한 응답과 그로 인해 수신되는 데이터를 가지고 있는 타입
struct NetworkResponse {
    
    let response: URLResponse
    let data: Data?
}
