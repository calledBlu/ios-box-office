//
//  DaumSearchImageDTO.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/15.
//

import Foundation

struct DaumSearchImageDTO: Decodable {
    let documents: [Document]
    let meta: Meta
}

struct Document: Decodable {
    let collection: Collection
    let datetime, displaySitename: String
    let docURL: String
    let height: Int
    let imageURL: String
    let thumbnailURL: String
    let width: Int

    enum CodingKeys: String, CodingKey {
        case collection, datetime
        case displaySitename = "display_sitename"
        case docURL = "doc_url"
        case height
        case imageURL = "image_url"
        case thumbnailURL = "thumbnail_url"
        case width
    }
}

enum Collection: String, Decodable {
    case blog = "blog"
    case cafe = "cafe"
    case etc = "etc"
    case news = "news"
}

struct Meta: Decodable {
    let isEnd: Bool
    let pageableCount, totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
