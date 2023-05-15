//
//  PresentationProvidable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import UIKit

protocol PresentationProvidable {

    func loadBoxOffices(date: String) async throws
    func loadMovieInformation(movieCode: String)
    func loadMoviePoster(movieName: String) async throws -> UIImage?
}
