//
//  NetworkUser.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct NetworkUser: Decodable {
    let id: Int64
    let login: String
    let avatarURL: URL
    let name: String?
    let company: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
        case name
        case company
    }
}
