//
//  NetworkProvider.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import Foundation

final class NetworkProvider: NetworkProvidable {
    
    private let session: NetworkSessionProtocol
    private let deserializer = JSONDeserializer()
    
    init(session: NetworkSessionProtocol) {
        self.session = session
    }
    
    // 데이터 가져와서 디코딩 하는 request
    func request<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) async throws -> Result<EndPoint.Response, NetworkError> {
        
        let request = try makeRequest(endPoint)
        let result = try await session.data(from: request)
        
        switch result {
        case .success(let data):
            let decodingData: EndPoint.Response = try deserializer.deserialize(data)
            return .success(decodingData)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func makeRequest<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) throws -> URLRequest {
        
        guard let url = makeURLComponents(endPoint)?.url else {
            throw NetworkError.failToMakeRequest
        }
        var request = URLRequest(url: url)
        
        // headers 설정
        endPoint.headers?.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = endPoint.httpMethod.rawValue
        
        // 추후 httpBody 설정
    
        return request
    }
    
    private func makeURLComponents<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) -> URLComponents? {
        
        // baseURL + path
        var components = URLComponents(string: endPoint.baseURL + endPoint.path)
        
        // task
        switch endPoint.task {
        // query 붙이기
        case .requestParameters(let urlParameters):
            var queryItems = [URLQueryItem]()
            urlParameters.forEach {
                let queryItem = URLQueryItem(name: $0.key, value: $0.value)
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
