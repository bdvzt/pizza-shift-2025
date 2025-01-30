//
//  PaymentUseCase.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol PayForPizzaUseCase {
    func execute(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse
}

class PayForPizzaUseCaseImpl: PayForPizzaUseCase {
    private let repository: PaymentRepository

    init(repository: PaymentRepository) {
        self.repository = repository
    }
    
    func execute(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse {
        return try await repository.pay(order: order)
    }
}
