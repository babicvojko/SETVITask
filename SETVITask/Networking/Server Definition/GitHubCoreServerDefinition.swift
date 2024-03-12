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
