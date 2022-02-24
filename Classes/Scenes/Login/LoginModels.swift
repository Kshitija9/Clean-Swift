//
//  LoginModels.swift
//  CleanSwift
//
//  Created by tmp8ol on 24/02/22.
//

import UIKit

struct User: Codable {
    let name: String
    let password: String
    let age: Int
}

struct Request {
    let username, password: String
}

struct Response {
    let user: User
}

struct ViewModelSuccess {
    let username: String
    let age: Int
}

struct ViewModelFailure {
    let errorMessage: String
}




