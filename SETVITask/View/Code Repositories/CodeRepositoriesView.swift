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
                errorView()
            } else if viewModel.isLoading {
                ProgressView()
                    .foregroundStyle(Color.black)
            } else {
                content()
            }
        }
        .navigationTitle("Repositories")
        .navigationBarTitleDisplayMode(.inline)
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
                    NavigationLink(repo.name) {
                        CommitsView(viewModel: viewModel.commitsViewModelFor(repository: repo))
                    }
                }
            }
        }
    }
    
    func errorView() -> some View {
        Text("There is some problem in connection with server. Tap to reload")
            .padding()
            .onTapGesture {
                Task {
                    // Instead this, there should be separate method in VM that will handle task cancelation etc.
                    await viewModel.fetch()
                }
            }
    }
}
