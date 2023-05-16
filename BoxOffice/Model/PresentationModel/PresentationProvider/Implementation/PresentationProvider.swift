//
//  PresentationProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import UIKit

final class PresentationProvider: PresentationProvidable {
    
    private let boxOfficeDispatcher = BoxOfficeDispatcher()
    private let movieInformationDispatcher = MovieInformationDispatcher()
    
    // 추후 Cache 처리
    private let cache = NSCache<NSURL, UIImage>()
    
    private var boxOffices: [BoxOfficeItem] = []
    private var movieInformation: MovieInformationItem?
    
    weak var boxOfficeDelegate: BoxOfficePresentationDelegate?
    weak var movieInformationDelegate: MovieInformationPresentationDelegate?
    
    var date: Date {
        didSet {
            let networkDate = date.formatData(type: .network)
            loadBoxOffices(date: networkDate)
        }
    }
    
    var movieCode: String = "" {
        didSet {
            loadMovieInformation(movieCode: movieCode)
        }
    }
    
    init() {
        self.date = Date.yesterday
        let yesterdayDate = date.formatData(type: .network)
        self.loadBoxOffices(date: yesterdayDate)
    }
    
    func loadBoxOffices(date: String) {
        
        let endpoint = DailyBoxOfficeEndpoint(date: date)
        
        Task {
            let networkData = try await boxOfficeDispatcher.fetch(endpoint: endpoint)
            let boxoffices = try await boxOfficeDispatcher.convert(from: networkData)
            self.boxOffices = boxoffices
            
            // 추후 삭제 -> notification center 변경
            boxOfficeDelegate?.callBoxOffices()
        }
    }
    
    func loadMovieInformation(movieCode: String) {
        
        let movieInformationEndpoint = MovieInformationEndpoint(movieCode: movieCode)
        
        Task {
            let networkData = try await self.movieInformationDispatcher.fetch(endpoint: movieInformationEndpoint)
            guard var movieInformation = try await self.movieInformationDispatcher.convert(from: networkData).first else { return }
            
            movieInformation.poster = try await loadMoviePoster(movieName: movieInformation.movieName)
            self.movieInformation = movieInformation
            
            print(movieInformation)
            movieInformationDelegate?.callMovieInformation()
        }
    }
    
    func loadMoviePoster(movieName: String) async throws -> UIImage? {
        
        let daumSearchImageEndpoint = DaumSearchImageEndpoint(movieName: movieName)
        
        let networkData = try await self.movieInformationDispatcher.fetchDaumImageDTO(daumSearchImageEndpoint)
            // 추후 NSCache 처리 해야한다.
        let moviePoster = try self.movieInformationDispatcher.convertImage(from: networkData)
        
        return moviePoster
    }
    
    func getBoxOffices() -> [BoxOfficeItem] {
        return self.boxOffices
    }
    
    func getBoxOfficeDate() -> String {
        return self.date.formatData(type: .title)
    }
    
    func getMovieInformation() -> MovieInformationItem? {
        return movieInformation
    }
}

protocol BoxOfficePresentationDelegate: AnyObject {
    func callBoxOffices()
}

protocol MovieInformationPresentationDelegate: AnyObject {
    func callMovieInformation()
}
