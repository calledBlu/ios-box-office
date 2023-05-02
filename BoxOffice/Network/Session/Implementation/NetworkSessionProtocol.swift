//
//  NetworkSessionProtocol.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

typealias NetworkResult = Result<Data, NetworkError>

protocol NetworkSessionProtocol {
    func data(from urlRequest: URLRequest) async throws -> NetworkResult
}
