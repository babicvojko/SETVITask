//
//  CommitMapper.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct CommitMapper {
    let commit: NetworkCommit
    
    func map() -> Commit {
        Commit(sha: commit.sha,
               author: commit.author?.login,
               description: commit.commit.message)
    }
}
