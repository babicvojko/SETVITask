//
//  ServerDefinition.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation
import Alamofire

protocol ServerDefinition {
    var baseServerURL: String { get }
    var headers: HTTPHeaders { get }
}
