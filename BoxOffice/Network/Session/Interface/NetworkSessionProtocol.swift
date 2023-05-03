//
//  NetworkSessionProtocol.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

typealias NetworkResult = Result<Data, Error>

protocol NetworkSessionProtocol {
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (NetworkResult) -> Void)

}
