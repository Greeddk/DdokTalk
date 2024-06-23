//
//  NetworkRequest.swift
//  DdokTalk
//
//  Created by Greed on 6/21/24.
//

import Foundation
import Combine
import CombineMoya
import Moya

final class NetworkRequest {
    
    private var cancellables = Set<AnyCancellable>()
    let manager = NetworkManager()
    
    func requestEmailValidation(email: String) -> AnyPublisher<Response, MoyaError> {
        return Future<Response, MoyaError> { promise in
            let query = EmailValidationQuery(email: email)
            let provider = MoyaProvider<AuthRouter>()
            provider.requestPublisher(.validation(query: query))
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("finished")
                    case .failure(let error):
                        print(error)
                    }
                } receiveValue: { response in
                    promise(.success(response))
                }
                .store(in: &self.cancellables)

        }
        .eraseToAnyPublisher()
    }
}
