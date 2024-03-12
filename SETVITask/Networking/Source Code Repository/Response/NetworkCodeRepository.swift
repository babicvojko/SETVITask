//
//  NetworkCodeRepository.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct NetworkCodeRepository: Decodable {
    let id: Int64
    let name: String
    let isPrivate: Bool
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case isPrivate = "private"
        case description
    }
}
