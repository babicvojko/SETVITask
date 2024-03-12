//
//  UserMapper.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct UserMapper {
    let user: NetworkUser
    
    func map() -> User {
        User(id: user.id,
             login: user.login,
             avatarURL: user.avatarURL,
             name: user.name,
             company: user.company)
    }
}
