//
//  Requestable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/01.
//

import UIKit

protocol Requestable {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask? { get }
    var headers: [String: String]? { get }
}

extension Requestable {
    
    // MARK: url -> urlrequest
    func makeRequest() throws -> URLRequest {
        
        guard let url = self.urlComponents?.url else {
            throw NetworkError.failToMakeRequest
        }
        var request = URLRequest(url: url)
        
        // headers 설정
        self.headers?.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = self.httpMethod.rawValue
        
        // 추후 httpBody 설정

        return request
    }
    
    // MARK: uri -> url
    var urlComponents: URLComponents? {
        // baseURL + path
        var components = URLComponents(string: self.baseURL + self.path)
        
        // task
        switch self.task {
        // query 붙이기
        case .requestParameters(let urlParameters):
            var queryItems = [URLQueryItem]()
            urlParameters.forEach {
                let queryItem = URLQueryItem(name: $0.key, value: $0.value as? String)
                queryItems.append(queryItem)
            }
            components?.queryItems = queryItems
            return components
        default:
            // request body를 작성하는 case. 추후 코드 수정
                // 여기서 이제 bodyParameters를 encoding해서 body를 작성해야 한다.
                // 근데 body는 components에서 접근할 수 없고, URLRequest.httpBody로 접근해서 설정해줘야함. 즉 여기서 작성할 수 없는 코드이다!!!!! 그럼.. 그냥 이 case 삭제할까..
            return components
        }
    }

}
