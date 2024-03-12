//
//  SourceCodeRemoteRepository.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

final class SourceCodeRemoteRepository: SourceCodeRepository {
    func codeRepositories(user: String) async throws -> [CodeRepository] {
        let response: [NetworkCodeRepository] = try await NetworkController.default.request(router: SourceCodeRemoteRouter.repositories(user))
        return response.map { CodeRepositoryMapper(codeRepository: $0).map() }
    }
    
    func commits(user: String, repository: String) async throws -> [Commit] {
        let response: [NetworkCommit] = try await NetworkController.default.request(router: SourceCodeRemoteRouter.commits(user, repository))
        return response.map { CommitMapper(commit: $0).map() }
    }
}
