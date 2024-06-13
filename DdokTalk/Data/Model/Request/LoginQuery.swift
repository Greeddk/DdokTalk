//
//  LoginQuery.swift
//  DdokTalk
//
//  Created by Greed on 6/13/24.
//

import Foundation

struct LoginQuery: Encodable {
    let email: String
    let password: String
    let deviceToken: String
}
