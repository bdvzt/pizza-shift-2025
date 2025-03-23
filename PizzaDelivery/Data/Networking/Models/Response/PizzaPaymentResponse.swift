//
//  PizzaPaymentResponse.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct PizzaPaymentResponse: Decodable
{
    let success: Bool
    let reason: String?
    let order: PizzaOrder
}
