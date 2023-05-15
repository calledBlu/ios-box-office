//
//  PresentationDispatchable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import UIKit

protocol PresentationDispatchable {
    
    associatedtype ViewModel: ViewDisplayable
    associatedtype Endpoint: RequestResponseProtocol
    
    var networkProvider: NetworkProvidable { get }
    func fetch(endpoint: Endpoint) async throws -> Endpoint.Response
    func convert(from networkData: Endpoint.Response) async throws -> [ViewModel]
}

extension PresentationDispatchable {
    
    var networkProvider: NetworkProvidable {
        return NetworkProvider()
    }
    
    func fetch(endpoint: Endpoint) async throws -> Endpoint.Response {
        
        let networkResult = try await networkProvider.request(endpoint)
        
        switch networkResult {
        case .success(let decodingData):
            return decodingData
        case .failure(let error):
            throw error
        }
    }
    
    func fetch(url: URL) async throws -> UIImage? {
        
        let imageResult = try await networkProvider.request(url)
        
        switch imageResult {
        case .success(let image):
            return image
        case .failure(let error):
            throw error
        }
    }
}
