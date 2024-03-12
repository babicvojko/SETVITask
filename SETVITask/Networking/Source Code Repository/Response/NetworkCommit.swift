//
//  NetworkCommit.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct NetworkCommit: Decodable {
    let sha: String
    let commit: NetworkCommitInfo
    let author: NetworkCommitAuthor?
}

struct NetworkCommitInfo: Decodable {
    let message: String
}

struct NetworkCommitAuthor: Decodable {
    let id: Int64
    let login: String
    let avatarURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }
}
