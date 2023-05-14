//
//  DaumAPI.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import Foundation

enum DaumAPI {
    
    case movieImage(String)
    
    static var scheme: String {
        return "https"
    }

    static var host: String {
        return "dapi.kakao.com"
    }
    
    var path: String {
        switch self {
        case .movieImage:
            return "/v2/search/image"
        }
    }
    
    var query: [URLQueryItem] {
        var queryItem = [URLQueryItem]()

        switch self {
        case .movieImage(let movieName):
            let queryValue = "\(movieName) 영화 포스터"
            let searchParameter = URLQueryItem(name: "query", value: queryValue)
            queryItem.append(searchParameter)
            
            return queryItem
        }
    }
    
    var header: [String: String] {
        var header = [String: String]()
        guard let apiKey = Bundle.main.daumApiKey else {
            return [:]
        }
        header["Authorization"] = "KakaoAK \(apiKey)"
        return header
    }
}
