//
//  NetworkError.swift
//  DdokTalk
//
//  Created by Greed on 6/21/24.
//

import Foundation

enum NetworkError: String {
    case unauthorized = "E01"
    case invalidRouter = "E97"
    case tokenExpire = "E05"
    case tokenAuthFailure = "E02"
    case failFetchAccountInfo = "E03"
    case overcall = "E98"
    case serverError = "E99"
}
