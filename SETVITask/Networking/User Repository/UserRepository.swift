//
//  UserRepository.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

protocol UserRepository {
    func profile() async throws -> User
}
