//
//  CreatePizzaPaymentAddressDto.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct CreatePizzaPaymentAddressDto: Codable
{
    let street: String
    let house: String
    let apartment: String
    let comment: String?
}
