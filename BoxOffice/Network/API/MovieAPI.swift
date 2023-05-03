//
//  MovieAPI.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

enum MovieAPI {
    
    case boxOffice
    case detailsOfMovie
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "kobis.or.kr"
    }
    
    var path: String {
        switch self {
        case .boxOffice:
            return moviePath + "/boxoffice/searchDailyBoxOfficeList.json"
        case .detailsOfMovie:
            return moviePath + "/movie/searchMovieInfo.json"
        }
    }
    
    var moviePath: String {
        return "/kobisopenapi/webservice/rest"
    }
    
    var keyParameter: [String: Any] {
        
        var result = [String: Any]()
        let apiKey = Bundle.main.apiKey
        result["key"] = apiKey
        
        return result
    }
    
}
    
