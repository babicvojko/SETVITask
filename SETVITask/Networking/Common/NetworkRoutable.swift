//
//  NetworkRoutable.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Alamofire

protocol NetworkRoutable {
    var method: HTTPMethod { get }
    var path: String { get }
}
