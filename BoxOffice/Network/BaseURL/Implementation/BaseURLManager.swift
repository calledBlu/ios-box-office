//
//  BaseURLManager.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

final class BaseURLManager: BaseURLRegisterable, BaseURLResolvable {

    // MARK: - Private property

    private var baseURLMap: [BaseURLType: String] = [:]


    // MARK: - Public
    
    func register(_ url: String, for type: BaseURLType) {

        baseURLMap[type] = url
    }

    func resolve(for type: BaseURLType) -> String {
        
        baseURLMap[type] ?? ""
    }
}
