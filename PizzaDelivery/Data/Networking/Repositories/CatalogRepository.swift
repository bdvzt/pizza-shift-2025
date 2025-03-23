//
//  CatalogRepository.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol CatalogRepository {
    func fetchCatalog() async throws -> PizzasResponse
    
}

class CatalogRepositoryImpl: CatalogRepository {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCatalog() async throws -> PizzasResponse {
        return try await networkService.request(endPoint: CatalogEndPoint.getCatalog, authorized: false)
    }
}
