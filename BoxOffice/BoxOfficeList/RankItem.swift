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
        RankItem(rank: Rank(rank: "1", rankInten: "0", new: .new), name: "경관의 피", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "2", rankInten: "-3", new: .old), name: "스파이더맨", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "3", rankInten: "+2", new: .old), name: "씽2게더", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "4", rankInten: "0", new: .old), name: "씽2게더", audience: "오늘 64,050 / 총 69,228")
    ]
}

struct Rank: Hashable {
    
    let number: String
    let detail : NSMutableAttributedString
    
    init(rank: String, rankInten: String, new: RankOldAndNewDTO) {
        
        self.number = rank
        let attributedString = NSMutableAttributedString()
        
        guard new != .new else {
            attributedString.append(NSAttributedString(string: "신작"))
            self.detail = attributedString
            return
        }
        
        guard rankInten != "0" else {
            attributedString.append(NSAttributedString(string: "-"))
            self.detail = attributedString
            return
        }
        
        let minusMark = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.blue)
        let plusMark = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.red)
        
        // String -> Int로 변환
        let comparison = Int(rankInten) ?? 0
        // 절댓값
        let comparisonNumber = abs(comparison)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = comparison > 0 ? plusMark : minusMark
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: comparisonNumber.description))
        
        self.detail = attributedString
    }
}
