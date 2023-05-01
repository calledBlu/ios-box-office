//
//  NetworkBuilder.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

// Builder가 아티클들에서 의미하는 EndPointType인 듯
protocol NetworkBuilder {

    associatedtype Response

    var baseURL: BaseURLType { get }
    var path: String { get }
    var headers: [String: String] { get }
    var query: [URLQueryItem] { get }
    var deserializer: NetworkDeserializable { get }
}

extension NetworkBuilder {

    var headers: [String: String] { [:] }
}
