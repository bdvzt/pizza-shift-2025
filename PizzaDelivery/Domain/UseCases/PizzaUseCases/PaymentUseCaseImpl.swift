//
//  PaymentUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol PaymentUseCase {
    func execute(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse
}

class PaymentUseCaseImpl: PaymentUseCase {
    private let repository: PizzaRepository

    init(repository: PizzaRepository) {
        self.repository = repository
    }
    
    func execute(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse {
        return try await repository.pay(order: order)
    }
}
