//
//  RankItem.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/07.
//

import UIKit

struct RankItem: Hashable {
    
    let rank: Rank
    let name: String
    let audience: String
    
    static let mock = [
        RankItem(rank: Rank(rank: "1", rankInten: "0", new: .new), name: "경관의 피", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "2", rankInten: "-3", new: .old), name: "스파이더맨", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "3", rankInten: "2", new: .old), name: "씽2게더", audience: "오늘 64,050 / 총 69,228"),
        RankItem(rank: Rank(rank: "4", rankInten: "0", new: .old), name: "씽2게더", audience: "오늘 64,050 / 총 69,228")
    ]
}

struct Rank: Hashable {
    
    let number: String
    let detail : NSMutableAttributedString
    
    init(rank: String, rankInten: String, new: RankOldAndNewDTO) {
        
        self.number = rank
        self.detail = NSMutableAttributedString()
        
        guard new != .new else {
            detail.append(NSAttributedString(string: "신작"))
            return
        }
        
        guard rankInten != "0" else {
            detail.append(NSAttributedString(string: "-"))
            return
        }
        
        // String -> Int로 변환
        let comparison = changeStringToInt(rankInten)
        // 절댓값 을 string으로
        let comparisonNumber = changeAbsoluteValue(comparison)
        // +/- 마크
        let upAndDownMark = makeupAndDownMark(by: comparison)
        detail.append(NSAttributedString(attachment: upAndDownMark))
        detail.append(NSAttributedString(string: comparisonNumber))
    }
}

extension Rank {
    
    private func changeStringToInt(_ value: String) -> Int {
        
        return Int(value) ?? 0
    }
    
    private func changeAbsoluteValue(_ value: Int) -> String {
        
        let comparisonNumber = abs(value)
        return comparisonNumber.description
    }
    
    private func makeupAndDownMark(by number: Int) -> NSTextAttachment {
        
        let minusMark = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.blue)
        let plusMark = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.red)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = number > 0 ? plusMark : minusMark
        
        return imageAttachment
    }
}
