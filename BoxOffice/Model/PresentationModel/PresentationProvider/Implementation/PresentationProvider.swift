//
//  PresentationProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import UIKit

final class PresentationProvider: PresentationProvidable {
    
    private let boxOfficeDispatcher = BoxOfficeDispatcher()
    
    private let cache = NSCache<NSURL, UIImage>()
    private var boxOffices: [BoxOfficeItem] = []
    
    weak var delegate: PresentationDelegate?
    
    private var date: Date {
        didSet {
            let networkDate = date.formatData(type: .network)
            loadBoxOffices(date: networkDate)
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
            delegate?.call()
        }
    }
    
    func getBoxOffices() -> [BoxOfficeItem] {
        return self.boxOffices
    }
    
    func getBoxOfficeDate() -> String {
        return self.date.formatData(type: .title)
    }
}

protocol PresentationDelegate: AnyObject {
    func call()
}
