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
    // boxoffices didset으로 notification 구현해서 vc에 업데이트 하라고 알리기
    
    weak var delegate: PresentationDelegate?
    
    private var date: String {
        didSet {
            loadBoxOffices(date: date)
        }
    }
    
    init() {
        self.date = Date.yesterday.formatData(type: .network)
        self.loadBoxOffices(date: date)
    }
    
    
    func loadBoxOffices(date: String) {
        
        let endpoint = DailyBoxOfficeEndpoint(date: date)
        
        Task {
            let networkData = try await boxOfficeDispatcher.fetch(endpoint: endpoint)
            let boxoffices = try await boxOfficeDispatcher.convert(from: networkData)
            self.boxOffices = boxoffices
            
            // 추후 삭제
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
