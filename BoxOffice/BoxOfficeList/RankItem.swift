//
//  RankItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/07.
//

import UIKit

struct RankItem {
    
    let rank: Rank
    let name: String
    let audience: String
    
}

struct Rank {
    
    let number: String
    let detail : String
//    let comparison: String
//    let new: RankOldAndNewDTO
    
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
}
