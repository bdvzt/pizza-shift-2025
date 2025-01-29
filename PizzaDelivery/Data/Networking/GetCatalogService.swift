//
//  GetCatalogService.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

class GetCatalogService {
    private let router = Router<CatalogEndPoint>()

    func getCatalog() async throws -> PizzasResponse {
        return try await withCheckedThrowingContinuation { continuation in
            router.request(.getCatalog) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    continuation.resume(throwing: NetworkError.invalidResponse)
                    return
                }

                print("HTTP Status Code:", httpResponse.statusCode)

                guard httpResponse.statusCode == 200, let data = data else {
                    continuation.resume(throwing: NetworkError.invalidResponse)
                    return
                }

                do {
                    let pizzasResponse = try JSONDecoder().decode(PizzasResponse.self, from: data)
                    continuation.resume(returning: pizzasResponse)
                } catch {
                    continuation.resume(throwing: NetworkError.invalidData)
                }
            }
        }
    }
}

