//
//  User.swift
//  iOSConcurrency
//
//  Created by Marcin Jędrzejak on 17/10/2022.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/users

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
