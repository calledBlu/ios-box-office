//
//  BaseURLResolvable.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

// baseURLType으로 접근하여 URL을 반환하도록 하는 프로토콜
protocol BaseURLResolvable {
    
    func resolve(for type: BaseURLType) -> String
}
