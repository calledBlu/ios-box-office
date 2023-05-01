//
//  NetworkError.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

enum NetworkError: Error {
    
    case notFoundBaseURL
    case responseNotFound
    case decodingFailure
}
