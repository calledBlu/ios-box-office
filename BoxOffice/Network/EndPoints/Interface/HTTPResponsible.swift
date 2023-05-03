//
//  HTTPResponsible.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

protocol HTTPResponsible {
    associatedtype Response: Decodable
}
