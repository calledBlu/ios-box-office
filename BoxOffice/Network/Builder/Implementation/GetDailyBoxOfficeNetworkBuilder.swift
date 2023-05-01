//
//  GetDailyBoxOfficeNetworkBuilder.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

struct GetDailyBoxOfficeNetworkBuilder: NetworkBuilder {

    typealias Response = DailyBoxOfficeListURL

    var baseURL: BaseURLType
    let path: String
    var query: [URLQueryItem] {
        return [
            URLQueryItem(name: "key", value: "aaa"),
            URLQueryItem(name: "targetDt", value: String(today: Date()))
        ]
    }

    var deserializer: NetworkDeserializable {
        JSONDeserializer(decoder: JSONDecoder())
    }

    init(key: String, date: Int, type: BaseURLType) {
        self.path = "kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        self.baseURL = type
    }
}
