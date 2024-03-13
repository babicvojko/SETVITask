//
//  User.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct User {
    let id: Int64
    let login: String
    let avatarURL: URL
    let name: String?
    let company: String?
}

extension User: Hashable {}
