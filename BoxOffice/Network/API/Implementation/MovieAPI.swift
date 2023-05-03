//
//  MovieAPI.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

enum MovieAPI: Callable {

    case dailyBoxOffice
    case movieInformation

    var path: String {
        switch self {
        case .dailyBoxOffice:
            return "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        case .movieInformation:
            return "/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
        }
    }
}
