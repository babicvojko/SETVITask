//
//  ProfileViewModel.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

@MainActor final class ProfileViewModel: ObservableObject {
    private let userRepository: UserRepository
    
    @Published var username: String = ""
    @Published var name: String? = nil
    @Published var avatarURL: URL? = nil
    @Published var company: String? = nil
    
    @Published var error: LocalError?
    @Published var isLoading: Bool = true
    
    init(userRepository: UserRepository = DataController.default.user) {
        self.userRepository = userRepository
    }
    
    func fetch() async {
        do {
            isLoading = true
            let profile = try await userRepository.profile()
            update(with: profile)
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
    
    // MARK: Private methods
    private func update(with user: User) {
        self.username = user.login
        self.name = user.name
        self.avatarURL = user.avatarURL
        self.company = user.company
    }
}
