//
//  PaymentRepository.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol PaymentRepository {
    func pay(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse
}

class PaymentRepositoryImpl: PaymentRepository {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func pay(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse {
        return try await networkService.request(endPoint: PaymentEndPoint.pay(order), authorized: false)
    }
}
