//
//  CodeRepositoriesView.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import SwiftUI

struct CodeRepositoriesView: View {
    @StateObject var viewModel: CodeRepositoriesViewModel
    
    init(viewModel: CodeRepositoriesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let _ = viewModel.error {
                Text("There is some problem in connection with server. Pull down to reload content")
            } else if viewModel.isLoading {
                ProgressView()
                    .foregroundStyle(Color.black)
            } else {
                content()
            }
        }
        .navigationTitle("Repositories")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: CodeRepository.self, destination: { repo in
            CommitsView(viewModel: viewModel.commitsViewModelFor(repository: repo))
        })
        .task {
            await viewModel.fetch()
        }
        .refreshable {
            await viewModel.fetch()
        }
    }
    
    @ViewBuilder func content() -> some View {
        List {
            Section {
                ForEach(viewModel.repositories) { repo in
                    NavigationLink(repo.name, value: repo)
                }
            }
        }
    }
}
