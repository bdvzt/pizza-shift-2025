//
//  PizzaRepository.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 29.01.2025.
//

import Foundation

protocol PizzaRepository {
    func pay(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse
    func getOrders() async throws -> PizzaOrdersResponse
}

class PizzaRepositoryImpl: PizzaRepository {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func pay(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse {
        return try await networkService.request(endPoint: PaymentEndPoint.pay(order), authorized: false)
    }
    
    func getOrders() async throws -> PizzaOrdersResponse {
        return try await networkService.request(endPoint: OrdersEndPoint.orders, authorized: true)
    }
}
