//
//  PresentationProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/15.
//

import Foundation

final class PresentationProvider: PresentationProvidable {
    
    private let boxOfficeDispatcher = BoxOfficeDispatcher()
    private let movieInformationDispatcher = MovieInformationDispatcher()
    private let moviePosterDispatcher = MoviePosterDispatcher()

    private var boxOffices: [BoxOfficeItem] = []
    private var movieInformation: [MovieInformationTextItem] = []
    private var moviePoster: [MoviePosterItem] = []
    
    weak var delegate: PresentationDelegate?
    weak var infoDelegate: InformationDelegate?
    
    var date: String? {
        didSet {
            loadBoxOffices(date: date ?? "")
        }
    }

    var movieCode: String? {
        didSet {
            loadMovieInformations(movieCode: movieCode ?? "")
        }
    }

    func loadBoxOffices(date: String) {
        
        let endpoint = DailyBoxOfficeEndpoint(date: date)
        
        Task {
            let networkData = try await boxOfficeDispatcher.fetch(endpoint: endpoint)
            let boxoffices = try await boxOfficeDispatcher.convert(from: networkData)
            self.boxOffices = boxoffices
            
            delegate?.call()
        }
    }
    
    func getBoxOffices() -> [BoxOfficeItem] {
        return self.boxOffices
    }

    func loadMovieInformations(movieCode: String) {
        let movieInformationEndPoint = MovieInformationEndpoint(movieCode: movieCode)
        
        Task {
            let informationNetworkData = try await movieInformationDispatcher.fetch(endpoint: movieInformationEndPoint)
            let movieInformation = try await movieInformationDispatcher.convert(from: informationNetworkData)
            self.movieInformation = movieInformation

            guard let movieName = movieInformation.first?.movieName else { return }

            let moviePosterEndPoint = MoviePosterEndpoint(movieName: movieName)
            let posterNetworkData = try await moviePosterDispatcher.fetch(endpoint: moviePosterEndPoint)

            let moviePoster = try await moviePosterDispatcher.convert(from: posterNetworkData)
            self.moviePoster = moviePoster

            infoDelegate?.call()
        }
    }
    
    func getMovieInformation() -> [MovieInformationTextItem] {
        return self.movieInformation
    }

    func getMoviePoster() -> [MoviePosterItem] {
        return self.moviePoster
    }
}

protocol PresentationDelegate: AnyObject {
    func call()
}

protocol InformationDelegate: AnyObject {
    func call()
}
