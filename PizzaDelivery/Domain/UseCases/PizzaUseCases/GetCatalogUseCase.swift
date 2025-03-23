//
//  GetCatalogUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol GetCatalogUseCase {
    func execute() async throws -> PizzasResponse
}

class GetCatalogUseCaseImpl: GetCatalogUseCase {
    private let repository: CatalogRepository

    init(repository: CatalogRepository) {
        self.repository = repository
    }

    func execute() async throws -> PizzasResponse {
        return try await repository.fetchCatalog()
    }
}
