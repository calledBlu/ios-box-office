//
//  String+.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/01.
//

import Foundation

extension String {

    init(today: Date) {

        let yesterday = today - 86400
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        self = formatter.string(from: yesterday)
    }
}
