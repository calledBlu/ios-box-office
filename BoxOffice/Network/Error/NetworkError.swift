//
//  NetworkError.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/01.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case notFoundAPIKey
    case outOfReponseCode
    case failToMakeRequest
    
    var errorDescription: String? {
        
        switch self {
        case .notFoundAPIKey:
            return "API Key를 찾지 못하였습니다."
        case .outOfReponseCode:
            return "응답코드가 정상코드 밖에 있습니다."
        case .failToMakeRequest:
            return "Request를 만드는데 실패했습니다."
        }
    }
}
