//
//  MovieInfoDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct MovieInfoDTO: Decodable {
    
    let result: MovieInfoResultDTO
    
    enum CodingKeys: String, CodingKey {
        case result = "movieInfoResult"
    }
}
