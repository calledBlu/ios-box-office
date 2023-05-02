//
//  MovieInfoResultDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

struct MovieInfoResultDTO: Decodable {
    
    let movieInfo: MovieDetailsDTO
    let source: String
}
