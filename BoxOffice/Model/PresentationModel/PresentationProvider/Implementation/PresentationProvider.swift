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
    
    init() {
        SceneDelegate().startDelegate = self
    }
    
    func loadBoxOffices(date: String) {
        
        let endpoint = DailyBoxOfficeEndpoint(date: date)
        
        Task {
            let networkData = try await boxOfficeDispatcher.fetch(endpoint: endpoint)
            let boxoffices = try await boxOfficeDispatcher.convert(from: networkData)
            self.boxOffices = boxoffices
            print(self.boxOffices.count)
            
            delegate?.call()
        }
    }
    
    func getBoxOffices() -> [BoxOfficeItem] {
        return self.boxOffices
    }
}

extension PresentationProvider: StartDelegate {
    
    func call() {
        loadBoxOffices(date: self.date)
        print("실행 됌")
    }
}

protocol PresentationDelegate: AnyObject {
    func call()
}

protocol StartDelegate: AnyObject {
    func call()
}
