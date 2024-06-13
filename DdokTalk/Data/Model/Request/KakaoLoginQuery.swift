//
//  KakaoLoginQuery.swift
//  DdokTalk
//
//  Created by Greed on 6/13/24.
//

import Foundation

struct KakaoLoginQuery: Encodable {
    let oauthToken: String
    let deviceToken: String
}
