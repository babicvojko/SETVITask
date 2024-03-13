//
//  CodeRepositoriesViewModel.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

@MainActor final class CodeRepositoriesViewModel: ObservableObject {
    private let codeRepository: SourceCodeRepository
    private let user: User
    
    @Published var repositories: [CodeRepository] = []
    
    @Published var error: LocalError?
    @Published var isLoading: Bool = true
    
    init(user: User, codeRepository: SourceCodeRepository = DataController.default.code) {
        self.user = user
        self.codeRepository = codeRepository
    }
    
    func fetch() async {
        do {
            isLoading = true
            //Better solution here will be to create separate entity for repositories that will be used inside VM
            self.repositories = try await codeRepository.codeRepositories(user: user.login)
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
    
    func commitsViewModelFor(repository: CodeRepository) -> CommitsViewModel {
        .init(user: self.user, repository: repository)
    }
}
