//
//  PresentationProvidable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/11.
//

import Foundation

protocol PresentationProvidable {

    func loadBoxOffices(date: String) async throws
}
