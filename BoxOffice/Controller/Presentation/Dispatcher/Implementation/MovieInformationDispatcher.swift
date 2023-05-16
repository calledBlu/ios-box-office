//
//  MovieInformationDispatcher.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/15.
//

import Foundation

struct MovieInformationDispatcher: PresentationDispatchable {

    typealias ViewModel = MovieInformationTextItem
    typealias Endpoint = MovieInformationEndpoint

    func convert(from networkData: MovieInformationDTO) async throws -> [MovieInformationTextItem] {

        let data = networkData.result.movieIformation

        var peopleNames: [String] {
            var names: [String] = []

            data.actors.forEach { name in
                names.append(name.peopleNm)
            }

            return names
        }

        let movieInformationText = [ViewModel(movieName: data.movieNm,
                                              producer: data.prdtStatNm,
                                              productYear: data.prdtYear,
                                              openDate: data.openDt,
                                              showTime: data.showTm,
                                              typeName: data.typeNm,
                                              nations: data.nations.first?.nationNm ?? "",
                                              genres: data.genres.first?.genreNm ?? "",
                                             peopleNames: peopleNames)]

        return movieInformationText
    }
}
