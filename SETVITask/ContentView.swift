//
//  ContentView.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                let user = try await DataController.default.user.profile()
                print(user)
                let repositories = try await DataController.default.sourceCode.codeRepositories(user: user.login)
                print(repositories)
                if let repo = repositories.first {
                    let commits = try await DataController.default.sourceCode.commits(user: user.login, repository: repo.name)
                    print(commits)
                }
                
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
