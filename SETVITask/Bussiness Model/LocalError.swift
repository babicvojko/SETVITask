//
//  LocalError.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

enum LocalError: Error {
    case internalServer(String)
    case api(String)
    case decoding(String?)
}
