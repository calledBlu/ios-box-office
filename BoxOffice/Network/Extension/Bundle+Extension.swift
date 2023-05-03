//
//  Bundle+Extension.swift
//  BoxOffice
//
//  Created by Blu on 2023/05/03.
//

import Foundation

extension Bundle {

    var apiKey: String? {
        guard let file = self.path(forResource: "Info", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource["MovieAPIKey"] as? String else {
            print(NetworkError.notFoundAPIKey.localizedDescription)
            return nil
        }
        return key
    }
}
