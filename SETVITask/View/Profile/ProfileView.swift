//
//  ProfileView.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if let _ = viewModel.error {
                    Text("There is some problem in connection with server. Pull down to reload content")
                } else if viewModel.isLoading {
                    ProgressView()
                        .foregroundStyle(Color.black)
                } else {
                    content()
                        .navigationTitle("My Profile")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .task {
            await viewModel.fetch()
        }
        .refreshable {
            await viewModel.fetch()
        }
    }
    
    @ViewBuilder func content() -> some View {
        List {
            avatarSectionView()
            accountInfoView()
            additionalLinksView()
        }
    }
    
    func avatarSectionView() -> some View {
        Section {
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    KFImage(viewModel.avatarURL)
                        .placeholder { Image.avatarPlaceholder }
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 100)
                        .clipShape(Circle())
                    if !viewModel.username.isEmpty {
                        Text("@\(viewModel.username)")
                            .foregroundStyle(Color.gray)
                    }
                }
                Spacer()
            }
        }
    }
    
    func accountInfoView() -> some View {
        Section("Account Info") {
            HStack {
                Text("Name: ")
                if let name = viewModel.name {
                    Text(name)
                } else {
                    Text("Unknown")
                        .foregroundStyle(Color.gray)
                }
            }
            
            HStack {
                Text("Company: ")
                if let company = viewModel.company {
                    Text(company)
                } else {
                    Text("Unknown")
                        .foregroundStyle(Color.gray)
                }
            }
        }
    }
    
    func additionalLinksView() -> some View {
        Section {
            Text("My Repositories")
        }
    }
}

//#Preview {
//    ProfileView()
//}
