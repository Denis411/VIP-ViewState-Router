//
//  ApiManager.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import Foundation

typealias NetworkResponse = (data: Data, response: URLResponse)

protocol ApiManagerProtocol {
    func get<D: Decodable>(from endpoint: ApiEndpoint) async throws -> D
    func getResponse(from endpoint: ApiEndpoint) async throws -> NetworkResponse
}

final class ApiManager {
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
}

extension ApiManager: ApiManagerProtocol {
    func get<D: Decodable>(from endpoint: ApiEndpoint) async throws -> D {
        let response = try await getResponse(from: endpoint)
        return try decoder.decode(D.self, from: response.data)
    }
    
    func getResponse(from endpoint: ApiEndpoint) async throws -> NetworkResponse {
        let request = try createRequest(from: endpoint)
        do {
            let response: NetworkResponse = try await session.data(for: request)
            return response
        } catch {
            throw error
        }
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
