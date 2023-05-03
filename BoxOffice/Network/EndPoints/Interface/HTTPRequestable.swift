//
//  HTTPRequestable.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

protocol HTTPRequestable {
    
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask? { get }
    var scheme: HTTPScheme { get }
    var host: HostType { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
    
}
