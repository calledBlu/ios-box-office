//
//  NetworkManager.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

final class NetworkManager {

    private let baseURLResolver: BaseURLResolvable
    private let networkSession: NetworkSessionProtocol

    init(
        baseURLResolver: BaseURLResolvable,
        networkSession: NetworkSessionProtocol
    ) {
        self.baseURLResolver = baseURLResolver
        self.networkSession = networkSession
    }

    private func makeRequest<Builder: NetworkBuilder>(_ builder: Builder) throws -> URLRequest {
        let baseURL = baseURLResolver.resolve(for: builder.baseURL)

        guard baseURL == "" else {
            throw NetworkError.notFoundBaseURL
        }

        var url: URL {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseURL
            components.path = builder.path
            components.queryItems = builder.query

            return components.url ?? URL(string: "")!
        }

        return URLRequest(url: url)
    }
}
