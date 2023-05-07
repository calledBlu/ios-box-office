//
//  BoxOfficeResultDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/04/25.
//

import Foundation

struct BoxOfficeResultDTO: Decodable {
    
    let dailyBoxOffices: [DailyBoxOfficesDTO]

    enum CodingKeys: String, CodingKey {
        
        case dailyBoxOffices = "dailyBoxOfficeList"
    }
}
