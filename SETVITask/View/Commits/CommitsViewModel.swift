//
//  CommitsViewModel.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

@MainActor final class CommitsViewModel: ObservableObject {
    private let codeRepository: SourceCodeRepository
    private let user: User
    private let repository: CodeRepository
    
    @Published var commits: [Commit] = []
    
    @Published var error: LocalError?
    @Published var isLoading: Bool = true
    
    init(user: User,
         repository: CodeRepository,
         codeRepository: SourceCodeRepository = DataController.default.code) {
        self.user = user
        self.repository = repository
        self.codeRepository = codeRepository
    }
    
    func fetch() async {
        do {
            isLoading = true
            //Better solution here will be to create separate entity for commits that will be used inside VM
            self.commits = try await codeRepository.commits(user: user.login, repository: repository.name)
            isLoading = false
            self.error = nil
        } catch let error as LocalError {
            self.error = error
            self.isLoading = false
        } catch {
            self.error = .unknown
            self.isLoading = false
        }
    }
}
