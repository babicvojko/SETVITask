//
//  SourceCodeRemoteRouter.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation
import Alamofire

enum SourceCodeRemoteRouter: NetworkRoutable {
    case repositories(String)
    case commits(String, String)
    
    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case let .repositories(user):
            return "/users/\(user)/repos"
        case let .commits(user, repo):
            return "/repos/\(user)/\(repo)/commits"
        }
    }
}
