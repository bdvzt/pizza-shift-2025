//
//  CreatePizzaPaymentDebitCardDto.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct CreatePizzaPaymentDebitCardDto: Codable
{
    let pan: String
    let expireDate: String
    let cvv: String
}
