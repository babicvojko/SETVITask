//
//  DataController.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

class DataController {
    static let `default` = DataController()
    
    private init() {}
    
    lazy var user: UserRepository = UserRemoteRepository()
    lazy var code: SourceCodeRepository = SourceCodeRemoteRepository()
}
