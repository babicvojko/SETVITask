//
//  Commit.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct Commit {
    let sha: String
    let author: String?
    let description: String
}

extension Commit: Hashable {}
