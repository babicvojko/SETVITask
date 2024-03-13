//
//  CommitsView.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import SwiftUI

struct CommitsView: View {
    @StateObject var viewModel: CommitsViewModel
    
    init(viewModel: CommitsViewModel) {
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
        .navigationTitle("Commits")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetch()
        }
        .refreshable {
            await viewModel.fetch()
        }
    }
    
    @ViewBuilder func content() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.commits) { commit in
                    VStack {
                        CommitRowView(commit: commit)
                            .padding([.leading, .trailing])
                            .padding([.top, .bottom], 5)
                        Divider()
                    }
                }
            }
        }
    }
}
