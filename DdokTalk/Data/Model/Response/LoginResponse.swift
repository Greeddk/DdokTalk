//
//  LoginResponse.swift
//  DdokTalk
//
//  Created by Greed on 6/16/24.
//

import Foundation

struct LoginResponse: Decodable {
    let userId: String
    let email: String
    let nickname: String
    let profileImage: String?
    let phone: String
    let provider: String
    let createdAt: String
    let Token: Token
}

struct Token: Decodable {
    let accessToken: String
    let refreshToken: String
}
