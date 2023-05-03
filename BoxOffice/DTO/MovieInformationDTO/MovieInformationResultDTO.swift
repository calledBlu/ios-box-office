//
//  MovieInformationResultDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct MovieInformationResultDTO: Decodable {
    
    let movieDetails: MovieDetailsDTO
    let source: String

    enum CodingKeys: String, CodingKey {
        case movieDetails = "movieInfo"
        case source
    }
}
