//
//  AppleLoginQuery.swift
//  DdokTalk
//
//  Created by Greed on 6/13/24.
//

import Foundation

struct AppleLoginQuery: Encodable {
    let idToken: String
    let nickname: String?
    let deviceToken: String
}
