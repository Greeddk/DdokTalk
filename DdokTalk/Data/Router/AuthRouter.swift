//
//  AuthRouter.swift
//  DdokTalk
//
//  Created by Greed on 6/13/24.
//

import Foundation
import Moya

enum AuthRouter {
    case join(query: JoinQuery)
    case validation(query: EmailValidationQuery)
    case login(query: LoginQuery)
    case loginKakao(query: KakaoLoginQuery)
    case loginApple(query: AppleLoginQuery)
    case logout
    case deviceToken(query: DeviceTokenQuery)
    case refresh
}

extension AuthRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConfig.baseURL.rawValue)!
    }
    
    var path: String {
        switch self {
        case .join:
            return "v1/users/join"
        case .validation:
            return "v1/users/validation/email"
        case .login:
            return "v1/users/login"
        case .loginKakao:
            return "v1/users/login/kakao"
        case .loginApple:
            return "v1/users/login/apple"
        case .logout:
            return "v1/users/logout"
        case .deviceToken:
            return "v1/users/deviceToken"
        case .refresh:
            return "v1/auth/refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .join:
            return .post
        case .validation:
            return .post
        case .login:
            return .post
        case .loginKakao:
            return .post
        case .loginApple:
            return .post
        case .logout:
            return .get
        case .deviceToken:
            return .post
        case .refresh:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .join(let query):
            return .requestJSONEncodable(query)
        case .validation(let query):
            return .requestJSONEncodable(query)
        case .login(let query):
            return .requestJSONEncodable(query)
        case .loginKakao(let query):
            return .requestJSONEncodable(query)
        case .loginApple(let query):
            return .requestJSONEncodable(query)
        case .logout:
            return .requestPlain
        case .deviceToken(let query):
            return .requestJSONEncodable(query)
        case .refresh:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .join:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .validation:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .login:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .loginKakao:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .loginApple:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .logout:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .deviceToken:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue]
        case .refresh:
            return [Headers.sesacKey.rawValue: APIConfig.sesacKey.rawValue,
                    Headers.refreshToken.rawValue: ""]
        }
    }
}
