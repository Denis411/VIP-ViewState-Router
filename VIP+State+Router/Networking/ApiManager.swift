//
//  ApiManager.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

protocol ApiManagerProtocol {
    func getData<D: Decodable>(from endpoint: ApiEndpoint) async throws -> D
}

final class ApiManager {
    private typealias NetworkResponse = (data: Data, response: URLResponse)
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
}

extension ApiManager: ApiManagerProtocol {
    func getData<D: Decodable>(from endpoint: ApiEndpoint) async throws -> D {
        let request = try createRequest(from: endpoint)
        let response: NetworkResponse = try await session.data(for: request)
        return try decoder.decode(D.self, from: response.data)
    }
}

private extension ApiManager {
    func createRequest(from endpoint: ApiEndpoint) throws -> URLRequest {
        guard
            let urlPath = URL(string: endpoint.baseURL.appending(endpoint.path)),
            var urlComponents = URLComponents(string: urlPath.path)
        else {
            throw ApiError.invalidPath
        }
        
        if let parameters = endpoint.parameters {
            urlComponents.queryItems = parameters
        }
        
        var request = URLRequest(url: urlPath)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headerFields
        return request
    }
}
