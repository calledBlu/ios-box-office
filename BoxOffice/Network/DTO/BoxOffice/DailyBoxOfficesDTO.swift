//
//  DailyBoxOfficesDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/04/25.
//

import Foundation

struct DailyBoxOfficesDTO: Decodable {
    
    let rank, rankInten: String
    let rankOldAndNew: RankOldAndNewDTO
    let movieCD, movieNm: String
    let audiCnt, audiAcc: String

    enum CodingKeys: String, CodingKey {
        
        case rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, audiCnt, audiAcc
    }
}

enum RankOldAndNewDTO: String, Decodable {

    case new = "NEW"
    case old = "OLD"
}
