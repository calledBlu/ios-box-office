//
//  BoxOfficeItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/09.
//

import Foundation

protocol ViewDisplayable {
    
}

struct BoxOfficeItem: ViewDisplayable {
    
    let rank: Rank
    let name: String
    let audience: String
    let movieCode: String
}
