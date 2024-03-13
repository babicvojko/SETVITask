//
//  Commit+.swift
//  SETVITask
//
//  Created by Babic Vojko on 13.3.24..
//

import Foundation

extension Commit: Identifiable {
    var id: String { sha }
}
