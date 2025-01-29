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
    private let router = Router<PaymentEndPoint>()
   
    func pay(order: CreatePizzaPaymentDto) async throws -> PizzaPaymentResponse {
        return try await withCheckedThrowingContinuation { continuation in
            router.request(.pay(order)) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201, let data = data else {
                    continuation.resume(throwing: NetworkError.invalidResponse)
                    return
                }
                
                do {
                    let paymentResponse = try JSONDecoder().decode(PizzaPaymentResponse.self, from: data)
                    continuation.resume(returning: paymentResponse)
                } catch {
                    continuation.resume(throwing: NetworkError.invalidData)
                }
            }
        }
    }
}
