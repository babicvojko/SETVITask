//
//  CommitRowView.swift
//  SETVITask
//
//  Created by Babic Vojko on 13.3.24..
//

import SwiftUI

struct CommitRowView: View {
    let commit: Commit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title: \(commit.description)")
            Text("Author: \(commit.author ?? "-")")
            Text("SHA: \(commit.sha)")
                .lineLimit(1)
                .foregroundStyle(Color.gray)
        }
    }
}
