//
//  MoviePosterDispatcher.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/16.
//

import Foundation

struct MoviePosterDispatcher: PresentationDispatchable {

    typealias ViewModel = MoviePosterItem
    typealias Endpoint = MoviePosterEndpoint

    func convert(from networkData: MoviePosterDTO) async throws -> [MoviePosterItem] {
        let data = networkData.results.first
        var movieSearch = [ViewModel]()

        let moviePosterURL = ViewModel(posterURL: data?.imageURL ?? "")
        movieSearch.append(moviePosterURL)

        return movieSearch
    }
}
