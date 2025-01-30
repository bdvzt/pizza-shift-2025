//
//  GetOrdersUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 30.01.2025.
//

import Foundation

protocol GetOrdersUseCase {
    func execute() async throws -> PizzaOrdersResponse
}

class GetOrdersUseCaseImpl: GetOrdersUseCase {
    private let repository: PizzaRepository

    init(repository: PizzaRepository) {
        self.repository = repository
    }

    func execute() async throws -> PizzaOrdersResponse {
        return try await repository.getOrders()
    }
}
