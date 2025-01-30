//
//  NetworkService.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func request<T: Decodable>(endPoint: EndPointType, authorized: Bool) async throws -> T
}

final class NetworkService: NetworkServiceProtocol {
    private let decoder = JSONDecoder()
    private let tokenStorage: TokenStorageProtocol
    
    init(tokenStorage: TokenStorageProtocol) {
        self.tokenStorage = tokenStorage
        self.decoder.dateDecodingStrategy = .iso8601
    }
    
    func request<T: Decodable>(endPoint: EndPointType, authorized: Bool) async throws -> T {
        let token = try await getToken(authorized: authorized)
        let request = try buildRequest(endPoint: endPoint, token: token)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        do {
            try handleResponse(response)
        } catch {
            throw NetworkError.serverError
        }
        
        return try decode(data)
    }
    
    private func decode<T: Decodable>(_ data: Data) throws -> T {
        guard let value = try? decoder.decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return value
    }
    
    private func handleResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299: return
        case 400: throw NetworkError.badRequest
        case 401: throw NetworkError.unauthorized
        case 403: throw NetworkError.forbidden
        case 404: throw NetworkError.notFound
        case 500: throw NetworkError.serverError
        default: throw NetworkError.unknown
        }
    }
    
    private func buildRequest(endPoint: EndPointType, token: String?) throws -> URLRequest {
        let urlString = Const.baseUrl + endPoint.path
        guard let url = URL(string: urlString) else { throw NetworkError.wrongURL }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        request.httpMethod = endPoint.httpMethod.rawValue
        request.setValue(Const.jsonContentType, forHTTPHeaderField: Const.contentTypeHeader)
        
        if let token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: Const.authorizationHeader)
        }
        
        switch endPoint.task {
        case .request:
            return request
        case let .requestBody(data):
            guard endPoint.httpMethod == .post || endPoint.httpMethod == .put else {
                throw NetworkError.methodNotAllowed
            }
            request.httpBody = data
            return request
        }
    }
    
    private func getToken(authorized: Bool) async throws -> String? {
        guard authorized else { return nil }
        
        if let token = tokenStorage.retrieveToken() {
            return token
        } else {
            throw NetworkError.unauthorized
        }
    }
    
}
