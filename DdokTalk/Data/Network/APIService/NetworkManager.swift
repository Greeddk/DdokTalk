//
//  NetworkManager.swift
//  DdokTalk
//
//  Created by Greed on 6/16/24.
//

import Foundation
import Moya
import Combine
import CombineMoya

final class NetworkManager {
    private let provider = MoyaProvider<MultiTarget>()
    
    func request<T: Decodable>(_ router: MainRouter, type: T.Type) -> AnyPublisher<T, MoyaError> {
        let target = MultiTarget(router.convertToTargetType())
        return provider.requestPublisher(target)
            .map(T.self)
            .eraseToAnyPublisher()
    }
}
