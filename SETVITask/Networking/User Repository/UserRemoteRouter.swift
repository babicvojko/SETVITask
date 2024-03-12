//
//  UserRemoteRouter.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation
import Alamofire

enum NewsRemoteRouter: NetworkRoutable {
    case profile
    
    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .profile:
            return "/user"
        }
    }
}
