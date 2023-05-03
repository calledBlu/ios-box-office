//
//  Providable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import UIKit

protocol NetworkProvidable {
    
//    func request<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) async throws -> Result<UIImage, NetworkError>
    func request<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) async throws -> Result<EndPoint.Response, NetworkError>
    
}

