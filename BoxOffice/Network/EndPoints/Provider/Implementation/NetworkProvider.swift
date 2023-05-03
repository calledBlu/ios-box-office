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
    func request<EndPoint: HTTPRequestResponseProtocol>(_ endPoint: EndPoint, completionHandler: @escaping (Result<EndPoint.Response, NetworkError>) -> Void) {

        var urlRequest: URLRequest

        makeRequest(endPoint) { result in
            switch result {
            case .success(let request):
                urlRequest = request
            case .failure(let error):
                completionHandler(.failure(error))
                return
            }
        }

        session.dataTask(with: urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let decodingData: EndPoint.Response = try deserializer.deserialize(data)
                    completionHandler(.success(decodingData))
                }
                catch {
                    completionHandler(.failure(NetworkError.failToDecodeData))
                }


            case .failure(_):
                completionHandler(.failure(NetworkError.failToLoadData))
                return
            }
        }
    }

    func makeRequest<EndPoint: HTTPRequestResponseProtocol>(_ endPoint: EndPoint, completionHandler: @escaping (Result<URLRequest, NetworkError>) -> Void) {

        guard let url = makeURL(endPoint) else {
            completionHandler(.failure(NetworkError.failToMakeURL))
        }
        var request = URLRequest(url: url)

        endPoint.headers?.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = endPoint.httpMethod.rawValue

        completionHandler(.success(request))
    }

    private func makeURL<EndPoint: HTTPRequestResponseProtocol>(_ endPoint: EndPoint) -> URL? {
        var components = URLComponents()
        components.scheme = endPoint.scheme.rawValue
        components.host = endPoint.host.rawValue
        components.path = endPoint.path
        components.queryItems = endPoint.query

        return components.url ?? URL(string: "")!

    }
}
