//
//  MainRouter.swift
//  DdokTalk
//
//  Created by Greed on 6/16/24.
//

import Foundation
import Moya

enum MainRouter {
    case authRouter(AuthRouter)
    
    func convertToTargetType() -> TargetType {
        switch self {
        case .authRouter(let authRouter):
            return authRouter
        }
    }
}
