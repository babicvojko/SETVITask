//
//  GitHubCoreServerDefinition.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation
import Alamofire

struct GitHubCoreServerDefinition: ServerDefinition {
    var baseServerURL: String {
        return "https://api.github.com"
    }
    
    var headers: HTTPHeaders {
        return [.authorization(bearerToken: "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")]
    }
}
