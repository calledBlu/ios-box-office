//
//  MovieInformationDispatcher.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import UIKit

struct MovieInformationDispatcher: PresentationDispatchable {
    
    typealias ViewModel = MovieInformationItem
    typealias Endpoint = MovieInformationEndpoint
    
    func convert(from networkData: MovieInformationDTO) throws -> [MovieInformationItem] {
        
        let data = networkData.result.movieIformation
        
        let director = data.directors.first?.peopleNm ?? ""
        let auditGrade = data.audits.first?.watchGradeNm ?? ""
        let nation = data.nations.first?.nationNm ?? ""
        
        let movieInformation = [ViewModel(movieName: data.movieNm,
                                         director: director,
                                         openDate: data.openDt,
                                         showTime: data.showTm,
                                         auditGrade: auditGrade,
                                         nation: nation,
                                         genre: data.genres,
                                         actor: data.actors)]
        
        return movieInformation
    }
    
    func fetchDaumImageDTO(_ endpoint: DaumSearchImageEndpoint) async throws -> DaumSearchImageEndpoint.Response {
        
        let networkResult = try await networkProvider.request(endpoint)
        
        switch networkResult {
        case .success(let decodingData):
            return decodingData
        case .failure(let error):
            throw error
        }
    }
    
    func convertImage(from networkData: DaumSearchImageDTO) throws -> UIImage? {
        
        let urlString = networkData.documents.first?.imageURL ?? ""
        guard var urlComponents = URLComponents(string: urlString) else {
            return nil
        }
        urlComponents.scheme = "https"
        guard let url = urlComponents.url else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        
        return UIImage(data: data)
    }
}
