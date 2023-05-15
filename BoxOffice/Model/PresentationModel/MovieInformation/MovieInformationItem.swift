//
//  MovieInformationItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

struct MovieInformationItem: ViewDisplayable {
    
    let movieName: String
    let poster: UIImage?
    let director: DirectorDTO
    let openDate: String
    let showTime: String
    let auditGrade: AuditDTO
    let nation: NationDTO
    let genre: GenreDTO
    let actor: ActorDTO
}
