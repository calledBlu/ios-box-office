//
//  Providable.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/02.
//

import UIKit

protocol NetworkProvidable {
    // 데이터 불러와 이미지 변환후 반환하는 함수
    // 그냥 Data로 넘길까?
//    func request<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) async throws -> Result<UIImage, NetworkError>
    // 데이터를 불러와 decoding까지 한 후 반환하는 함수
    func request<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) async throws -> Result<EndPoint.Response, NetworkError>
    // request 만드는 함수
    func makeRequest<EndPoint: RequestResponseProtocol>(_ endPoint: EndPoint) throws -> URLRequest
}

