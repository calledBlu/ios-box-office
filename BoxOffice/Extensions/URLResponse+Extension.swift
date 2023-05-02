//
//  URLResponse+Extension.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

extension URLResponse {
    
    private var successRange: ClosedRange<Int> {
        
        return 200...299
    }
    
    var checkResponse: Bool {
        
        guard let httpResponse = self as? HTTPURLResponse,
              successRange.contains(httpResponse.statusCode) else {
            return false
        }
        
        return true
    }
}
