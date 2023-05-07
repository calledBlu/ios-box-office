//
//  RankItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/07.
//

import UIKit

struct RankItem: Hashable {
    
//    private let id = UUID()
    let rank: Rank
    let name: String
    let audience: String
    
    static let mock = [
        RankItem(rank: Rank(number: "1", detail: "신작"), name: "경관의 피", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(number: "2", detail: "🔺2"), name: "스파이더맨", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(number: "3", detail: "신작"), name: "씽2게더", audience: "오늘 64,050 / 총 69,228")
    ]
}

struct Rank: Hashable {
    
    let number: String
    let detail : String
    
//    let comparison: String
//    let new: RankOldAndNewDTO
//
//    var description: String {
//
//        guard let comparison = Int(comparison) else { return "" }
//
//        let minusMark = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.blue)
//        let plusMark = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.red)
//
//        let comparisonNumber = abs(comparison)
//        let upAndDown = comparison > 0 ? "\(plusMark)" : "\(minusMark)"
//
//        let newString = "신작"
//
//        return new == .new ? "신작"
//    }
    
    // 추후 NSAttributedString 키워드 검색 ㄱㄱ
//    init(number: String, new: RankOldAndNewDTO) {
//
//    }
}
