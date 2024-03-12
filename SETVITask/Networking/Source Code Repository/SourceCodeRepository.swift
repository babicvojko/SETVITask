//
//  SourceCodeRepository.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

protocol SourceCodeRepository {
    func codeRepositories(user: String) async throws -> [CodeRepository]
    func commits(user: String, repository: String) async throws -> [Commit]
}
