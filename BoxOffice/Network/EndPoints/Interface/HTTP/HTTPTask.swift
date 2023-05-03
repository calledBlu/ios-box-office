//
//  HTTPTask.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

enum HTTPTask {
    
    case requestPlain
    case requestParameters(urlParameters: [String: Any])
    case requestParametersAndBody(bodyParameters: String, urlParameters: [String: Any])
}
