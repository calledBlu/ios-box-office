//
//  Providable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import UIKit

protocol NetworkProvidable {
    func request<EndPoint: HTTPRequestResponseProtocol>(_ endPoint: EndPoint, completionHandler: @escaping (Result<EndPoint.Response, NetworkError>) -> Void)
    func makeRequest<EndPoint: HTTPRequestResponseProtocol>(_ endPoint: EndPoint, completionHandler: @escaping (Result<URLRequest, NetworkError>) -> Void)
}

