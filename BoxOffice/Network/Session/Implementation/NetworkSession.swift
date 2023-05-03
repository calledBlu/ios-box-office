//
//  NetworkSession.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

final class NetworkSession: NetworkSessionProtocol {

    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (NetworkResult) -> Void) {

            let task = session.dataTask(with: request) { (data, response, error) in

                guard let response = response else {
                    completionHandler(.failure(NetworkError.notFoundAPIKey))
                    return
                }

                guard response.checkResponse else {
                    completionHandler(.failure(NetworkError.outOfReponseCode))
                    return
                }

                completionHandler(.success(data ?? Data()))
            }
            task.resume()
    }
}
