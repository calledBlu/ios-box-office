//
//  MovieInformationDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct MovieInformationDTO: Decodable {
    
    let result: MovieInformationResultDTO
    
    enum CodingKeys: String, CodingKey {
        case result = "movieInfoResult"
    }
}
