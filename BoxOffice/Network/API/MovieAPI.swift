//
//  MovieAPI.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

enum MovieAPI {
    
    case todayBoxOffice
    case detailsOfMovie
    
    var baseURL: String {
        return "http://www.kobis.or.kr"
    }
    
    var path: String {
        switch self {
        case .todayBoxOffice:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml"
        case .detailsOfMovie:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml"
        }
    }
    
    // 여기서 URLQueryItem을 직접 다루는 것이 이상해서 string dictionary로 바꿈
//    var urlParameters: [URLQueryItem] {
//
//        let apiKey = URLQueryItem(name: "key", value: Bundle.main.apiKey)
//
//        switch self {
//        case .todayBoxOffice:
//            let today = "20230502"
//            let targetDay = URLQueryItem(name: "targetDt", value: today)
//            return [apiKey, targetDay]
//        case .detailsOfMovie:
//            let code = "20124079"
//            let movieCode = URLQueryItem(name: "movieCd", value: code)
//            return [apiKey, movieCode]
//        }
//    }
    
    var urlParameters: [String: String] {
        
        var result = [String: String]()
        let apiKey = Bundle.main.apiKey!
        result["key"] = apiKey
        
        switch self {
        case .todayBoxOffice:
            let targetDate = "targetDt"
            let today = "20230502"
            result[targetDate] = today
        case .detailsOfMovie:
            let movieCode = "movieCd"
            let code = "20124079"
            result[movieCode] = code
        }
        
        return result
    }
    
    // ver1. 접근: .todayBoxOffice.endPoint
//    var endPoint: Requestable {
//        return EndPoint(baseURL: self.baseURL,
//                        path: self.path,
//                        httpMethod: .get,
//                        task: .requestParameters(urlParameters: urlParameters)
//        )
//    }
}

extension MovieAPI {
    
    // ver2. 접근: MovieAPI.getMovieInfo(with: .todayBoxOffice)
    // ver3. movieAPI 타입이 아닌, DTO에 해당 속성들을 extension으로 추가하고, 접근 자체를 DTO로 하는 방법 -> DTO는 비지니스 로직을 가지면 안되기 때문에 취소@
//    static func getMovieInfo(with movieAPI: MovieAPI) -> EndPoint {
//        return EndPoint(baseURL: movieAPI.baseURL,
//                        path: movieAPI.path,
//                        httpMethod: .get,
//                        task: .requestParameters(urlParameters: movieAPI.urlParameters)
//                        )
//    }
}
