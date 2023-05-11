//
//  PresentationProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import Foundation

final class PresentationProvider: PresentationProvidable {
    
    private let boxOfficeDispatcher = BoxOfficeDispatcher()
    private var boxOffices: [BoxOfficeItem] = []
    
    weak var delegate: PresentationDelegate?
    
    private var date: String = Date.yesterday.formatData(type: .network) {
        didSet {
            loadBoxOffices(date: date)
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
}

protocol PresentationDelegate: AnyObject {
    func call()
}
