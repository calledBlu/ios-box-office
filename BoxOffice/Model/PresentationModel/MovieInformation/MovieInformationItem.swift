//
//  MovieInformationItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/14.
//

import UIKit

struct MovieInformationItem: ViewDisplayable {
    
    let movieName: String
    var poster: UIImage?
    let director: String
    let openDate: String
    let showTime: String
    let auditGrade: String
    let nation: String
    let genre: String
    let actor: String
    
    init(movieName: String, poster: UIImage? = nil, director: String, openDate: String, showTime: String, auditGrade: String, nation: String, genre: [GenreDTO], actor: [ActorDTO]) {
        self.movieName = movieName
        self.poster = poster
        self.director = director
        self.openDate = openDate
        self.showTime = showTime
        self.auditGrade = auditGrade
        self.nation = nation
        
        self.genre = genre.map { $0.genreNm }.joined(separator: ", ")
        self.actor = actor.map { $0.peopleNm }.joined(separator: ", ")
    }
}
