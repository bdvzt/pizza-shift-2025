//
//  PizzaOrder.swift
//  PizzaDelivery
//
//  Created by Zayata Budaeva on 28.01.2025.
//

import Foundation

struct PizzaOrder
{
    let pizzas: [OrderedPizza]
    let person: PizzaPerson
    let receiverAddress: PizzaAddress
    let status: Status
    let cancellable: Bool
}

