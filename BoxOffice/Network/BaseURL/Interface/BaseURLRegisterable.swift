//
//  BaseURLRegisterable.swift
//  BoxOffice
//
//  Created by Blu on 2023/04/29.
//

import Foundation

/// URL과 그 타입을 등록할 수 있도록 하는 프로토콜
protocol BaseURLRegisterable {
    
    func register(_ url: String, for type: BaseURLType)
}
