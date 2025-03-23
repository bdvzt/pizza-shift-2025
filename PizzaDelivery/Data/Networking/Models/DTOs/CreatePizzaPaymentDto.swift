//
//  CreatePizzaPaymentDto.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct CreatePizzaPaymentDto: Codable
{
    let receiverAddress: CreatePizzaPaymentAddressDto
    let person: CreatePizzaPaymentPersonDto
    let debitCard: CreatePizzaPaymentDebitCardDto
    let pizzas: [OrderedPizza]
}
