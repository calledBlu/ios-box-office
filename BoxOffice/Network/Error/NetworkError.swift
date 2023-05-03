//
//  NetworkError.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

enum NetworkError: LocalizedError {

    case notFoundAPIKey
    case outOfReponseCode
    case failToMakeRequest
    case failToMakeURL
    case failToLoadData
    case failToDecodeData

    var errorDescription: String? {
        switch self {
        case .notFoundAPIKey:
            return "API Key를 찾지 못하였습니다."
        case .outOfReponseCode:
            return "응답코드가 정상코드 밖에 있습니다."
        case .failToMakeRequest:
            return "Request를 만드는 데 실패했습니다."
        case .failToMakeURL:
            return "URL을 만드는 데 실패했습니다."
        case .failToLoadData:
            return "데이터를 로드하는 데 실패했습니다."
        case .failToDecodeData:
            return "데이터를 디코딩하는 데 실패했습니다.failToDecodeData"
        }
    }
}
