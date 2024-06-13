//
//  JoinQuery.swift
//  DdokTalk
//
//  Created by Greed on 6/13/24.
//

import Foundation

struct JoinQuery: Encodable {
    let email: String
    let password: String
    let nickname: String
    let phone: String
    let deviceToken: String?
}
