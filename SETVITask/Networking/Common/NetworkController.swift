//
//  NetworkController.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation
import Alamofire

enum NetworkControllerParameterEncoder {
    case url
    case json
}

private extension NetworkControllerParameterEncoder {
    var encoder: ParameterEncoder {
        switch self {
        case .url:
            return URLEncodedFormParameterEncoder.default
        case .json:
            return JSONParameterEncoder.default
        }
    }
}

private struct EmptyBody: Encodable {}

class NetworkController {
    static let `default` = NetworkController()
    var serverDefinition: ServerDefinition
    var session: Session = {
        let configuration = URLSessionConfiguration.default
        return Session(configuration: configuration)
    }()
    let responseConcurrentQueue = DispatchQueue(label: "com.setvi.networkResponse",
                                                attributes: [.concurrent])
    private let jsonDecoder = JSONDecoder()
    // MARK: - Initialization
    
    private init(serverDefinition: ServerDefinition = GitHubCoreServerDefinition()) {
        self.serverDefinition = serverDefinition
    }
}

extension NetworkController {
        func request<Request, Response>(router: NetworkRoutable,
                                        request: Request? = nil,
                                        encoder: NetworkControllerParameterEncoder? = nil,
                                        headers: HTTPHeaders? = nil)
    async throws -> Response where Request: Encodable, Response: Decodable {
        try await withUnsafeThrowingContinuation { continuation in
            let encoder = encoder ?? getDefaultEncoder(router: router, request: request)
            session.request(serverDefinition.baseServerURL + router.path,
                            method: router.method,
                            parameters: request,
                            encoder: encoder.encoder,
                            headers: headers ?? serverDefinition.headers)
            .validate()
            .responseDecodable(of: Response.self, queue: DispatchQueue.main, decoder: jsonDecoder) { response in
                switch response.result {
                case .success(let output):
                    continuation.resume(returning: output)
                case .failure(let error):
                    continuation.resume(throwing: LocalError.internalServer(error.localizedDescription))
                }
            }
        }
    }
    
    func request<Response>(router: NetworkRoutable,
                           encoder: NetworkControllerParameterEncoder? = nil,
                           headers: HTTPHeaders? = nil) async throws -> Response where Response: Decodable {
        try await request(router: router, request: Optional<EmptyBody>.none, encoder: encoder, headers: headers)
    }

    private func getDefaultEncoder<Request>(router: NetworkRoutable, request: Request?) -> NetworkControllerParameterEncoder {
        request != nil && router.method == .get ? .url : .json
    }
}
