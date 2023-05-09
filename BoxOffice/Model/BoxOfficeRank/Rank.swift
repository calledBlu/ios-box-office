//
//  Rank.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/09.
//

import UIKit

struct Rank: Hashable {
    
    let number: String
    let detail: NSMutableAttributedString
    
    init(rank: String, rankIntensity: String, rankOldAndNew: RankOldAndNewDTO ) {
        self.number = rank
        self.detail = NSMutableAttributedString()
        
        guard rankOldAndNew == .old else {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.systemRed
            ]
            let description = NSAttributedString(string: "신작", attributes: attributes)
            detail.append(description)
            return
        }
        
        guard let rankIntensity = Int(rankIntensity) else {
            return
        }
        
        let rankMark = makeRankMark(by: rankIntensity)
        let attachment = NSAttributedString(attachment: rankMark)
        detail.append(attachment)
        
        if rankIntensity != .zero {
            let description = NSAttributedString(string: rankIntensity.description)
            detail.append(description)
        }
    }
}

extension Rank {
    
    private func makeRankMark(by number: Int) -> NSTextAttachment {
        
        let minusMark = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.blue)
        let plusMark = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.red)
        let dashMark = UIImage(systemName: "minus")
        
        let imageAttachment = NSTextAttachment()
        
        if number == 0 {
            imageAttachment.image = dashMark
        } else {
            imageAttachment.image = number > 0 ? plusMark : minusMark
        }
        
        return imageAttachment
    }
}
