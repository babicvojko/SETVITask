//
//  UserRemoteRepository.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

final class UserRemoteRepository: UserRepository {
    func profile() async throws -> User {
        let response: NetworkUser = try await NetworkController.default.request(router: NewsRemoteRouter.profile)
        return UserMapper(user: response).map()
    }
}
