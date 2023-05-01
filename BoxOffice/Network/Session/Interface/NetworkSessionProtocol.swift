//
//  NetworkSessionProtocol.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

protocol NetworkSessionProtocol {
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Result<NetworkResponse, Error>) -> Void
    )
}
